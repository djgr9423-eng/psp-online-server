# Configurar PPSSPP para el servidor privado

Esta guía es para dos teléfonos Android con PPSSPP. El servidor usa el protocolo de retransmisión Ad Hoc `aemu_postoffice`.

## Antes de empezar

- PPSSPP 1.20.1 o posterior en ambos teléfonos.
- El servidor está desplegado y accesible en Internet.
- El firewall del VPS permite los puertos documentados.
- Ambos jugadores usan una versión compatible del juego y el mismo modo Ad Hoc.

## En ambos teléfonos

1. Abre PPSSPP y entra a **Settings / Networking**.
2. Activa la opción de networking.
3. Configura un nickname distinto para cada jugador.
4. En **Ad Hoc multiplayer**, pulsa la dirección del servidor o **Add server**.
5. Introduce la IP pública o el nombre DNS de tu VPS.
6. Activa **Relay server mode** para el servidor privado.
7. Ajusta **Try to use server-provided packet relay** a **Auto**.
8. Desactiva **Enable UPnP** para esta configuración.
9. Configura el mismo **Port offset** en ambos; normalmente se recomienda `10000`.
10. Guarda los ajustes y abre el mismo modo multijugador Ad Hoc del juego.

No confundas la dirección del VPS con una dirección web HTTP: escribe solo el host/IP en el campo de servidor, siguiendo el formato que solicite tu versión de PPSSPP.

## Probar

1. Conecta el primer teléfono a una red y el segundo a otra, por ejemplo Wi-Fi y datos móviles.
2. Inicia el modo Ad Hoc del juego en ambos.
3. Comprueba si pueden encontrarse, entrar en la misma sala y empezar una partida.
4. Si falla, prueba primero con otro juego Ad Hoc conocido para separar un problema del servidor de uno específico de PES 6.

## Diagnóstico

- Si el servidor no aparece o no conecta, revisa IP pública, estado del contenedor, firewall y puertos.
- Si el cliente conecta pero no ve salas, revisa el ID del juego y la compatibilidad del juego/modo.
- Si la sala funciona pero la partida no empieza, registra las versiones exactas del juego y PPSSPP.

Este documento describe el procedimiento esperado; no afirma que PES 6 ya haya superado la prueba.
