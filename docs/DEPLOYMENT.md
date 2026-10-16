# Desplegar en un VPS Linux

Este proyecto usa el servidor de retransmisión de código abierto [Kethen/aemu_postoffice](https://github.com/Kethen/aemu_postoffice). PPSSPP documenta el protocolo `aemu_postoffice` para retransmitir paquetes Ad Hoc. Esto prepara una base compatible con el protocolo, pero **no demuestra todavía que PES 6 haya sido probado con este servidor**.

## Requisitos

- VPS Linux con dirección IP pública y acceso SSH.
- Docker Engine y el complemento Docker Compose.
- Permisos para abrir los puertos en el firewall del VPS y en el panel del proveedor.
- PPSSPP 1.20.1 o posterior en ambos teléfonos para usar el modo de retransmisión descrito en la documentación oficial.

Instala Docker siguiendo la documentación oficial para la distribución del VPS: https://docs.docker.com/engine/install/

## Desplegar

En el VPS:

```bash
sudo apt-get update
sudo apt-get install -y git
git clone https://github.com/djgr9423-eng/psp-online-server.git
cd psp-online-server
docker compose up -d --build
docker compose logs -f
```

El Dockerfile descarga el código fuente de upstream y compila el servidor durante la construcción. La referencia predeterminada es `main`; para una construcción reproducible conviene fijar `AEMU_REF` a una etiqueta o commit revisado.

## Puertos

La guía upstream documenta estos puertos:

| Puerto | Protocolo | Uso |
|---|---|---|
| 27312 | TCP y UDP | Servicio adhocctl |
| 27313 | TCP y UDP | Retransmisión de paquetes |
| 8888 | TCP | Página de estado HTTP |

Docker publica 27312 y 27313 en TCP/UDP. El puerto 8888 queda enlazado solo a `127.0.0.1` del VPS para no exponer la página de estado al público por defecto.

Configura el firewall para permitir conexiones entrantes a 27312/TCP, 27312/UDP, 27313/TCP y 27313/UDP. Por ejemplo, con UFW:

```bash
sudo ufw allow 27312/tcp
sudo ufw allow 27312/udp
sudo ufw allow 27313/tcp
sudo ufw allow 27313/udp
sudo ufw status
```

Comprueba también las reglas del proveedor de VPS. No abras 8888 al público si no necesitas la página de estado.

Para consultar la página desde tu ordenador, puedes crear un túnel SSH:

```bash
ssh -L 8888:127.0.0.1:8888 usuario@IP_DEL_VPS
```

Luego abre `http://127.0.0.1:8888` en ese ordenador. Sustituye los valores de ejemplo por tus datos; no publiques credenciales ni claves SSH.

## Actualizar o detener

```bash
git pull
docker compose up -d --build
docker compose logs --tail=100
docker compose down
```

## Configuración de PPSSPP

En ambos dispositivos:

1. Usa una versión compatible con relay (1.20.1 o posterior, según la guía oficial).
2. Activa Networking y configura un apodo.
3. En Ad Hoc multiplayer, añade la IP pública del VPS como servidor personalizado.
4. Activa **Relay server mode** para esa entrada.
5. Configura **Try to use server-provided packet relay** en Auto.
6. Desactiva UPnP para esta configuración.
7. Usa el mismo **Port offset** en ambos; normalmente se recomienda `10000`.
8. Entra en el mismo modo Ad Hoc del juego.

Los nombres exactos de los menús pueden variar por versión.

## Compatibilidad de juegos y PES 6

El relay está diseñado para tráfico Ad Hoc compatible de varios juegos, pero no garantiza que todos funcionen. La compatibilidad depende del juego, su ID/región y el cliente.

Pruebas pendientes:
- Confirmar el ID de juego que informa la copia de PES 6 utilizada.
- Verificar que el ID está contemplado en la base de datos upstream.
- Probar que ambos teléfonos pueden entrar a la misma sala.
- Completar una partida real y registrar el resultado.

No se debe anunciar compatibilidad verificada hasta completar estas pruebas.

## Seguridad

- Mantén Docker y el sistema operativo actualizados.
- No publiques credenciales ni secretos.
- Revisa cambios upstream antes de actualizar.
- El servicio recibe tráfico de red público; monitoriza los logs y limita recursos del VPS.
