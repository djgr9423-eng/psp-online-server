# PSP Online Server

Proyecto para desplegar un servidor privado de retransmisión Ad Hoc para PPSSPP y juegos compatibles de PSP, alojado en un VPS Linux.

**Estado:** archivos de despliegue añadidos; todavía no se ha desplegado ni probado una partida real de PES 6.

## Base técnica

PPSSPP documenta soporte para retransmisión mediante el protocolo `aemu_postoffice` a partir de PPSSPP 1.20.1. Este repositorio prepara Docker para construir el servidor de código abierto [Kethen/aemu_postoffice](https://github.com/Kethen/aemu_postoffice) y configurar los puertos necesarios.

No implementamos un protocolo de red propio desde cero: reutilizamos una implementación existente para evitar crear un servidor incompatible.

## Archivos

- `Dockerfile`: compila el servidor upstream durante la construcción.
- `docker-compose.yml`: ejecuta el servidor con reinicio automático.
- `config.json`: configuración del relay y del servicio adhocctl.
- `docs/PPSSPP-SETUP.md`: pasos para configurar ambos teléfonos.
- `docs/DEPLOYMENT.md`: instrucciones de despliegue y firewall.
- `docs/PES6-TESTS.md`: lista de verificación para probar juegos.

## Inicio rápido en un VPS

Instala Docker Engine y Docker Compose según la documentación oficial de Docker. Después:

```bash
git clone https://github.com/djgr9423-eng/psp-online-server.git
cd psp-online-server
docker compose up -d --build
docker compose logs -f
```

Abre en el firewall del VPS estos puertos entrantes, en TCP y UDP: `27312` y `27313`. El panel de estado del puerto `8888` queda limitado a localhost.

## Configurar PPSSPP

Consulta [docs/PPSSPP-SETUP.md](docs/PPSSPP-SETUP.md). Ambos teléfonos deben utilizar una versión de PPSSPP compatible con relay y configurar la misma dirección de servidor y el mismo port offset.

## Compatibilidad con PES 6 y otros juegos

El relay sirve para tráfico Ad Hoc compatible de varios juegos, pero no garantiza que cada juego funcione. La compatibilidad de PES 6 todavía debe probarse con el ID/región del juego usado por ambos jugadores. No se afirma que ya se haya completado una partida de prueba.

## Referencias

- [PPSSPP — Quickstart multiplayer](https://www.ppsspp.org/docs/multiplayer/quickstart/)
- [PPSSPP — Ad hoc multiplayer](https://www.ppsspp.org/docs/multiplayer/how-to-play/)
- [Servidor upstream aemu_postoffice](https://github.com/Kethen/aemu_postoffice)
- [Guía upstream de hosting](https://github.com/Kethen/aemu_postoffice/blob/main/hosting.md)

## Licencias

Este repositorio contiene configuración y documentación propias, y descarga el servidor upstream durante el build. Revisa la licencia GPL-3.0 del proyecto upstream antes de redistribuir imágenes o binarios compilados.
