# Lista de pruebas: PES 6 en PPSSPP Android

La base de datos upstream de `aemu_postoffice` consultada durante la preparación incluye entradas para los IDs `ULES00476` (PES 6 europeo) y `ULUS10169` (versión estadounidense Winning Eleven: Pro Evolution Soccer 2007), además de alias regionales. Esto indica que el servidor conoce esas IDs, pero no confirma que una partida de PES 6 funcione sin problemas.

## Datos del entorno

- Teléfono A / versión de Android:
- Teléfono B / versión de Android:
- PPSSPP A y B (se recomienda 1.20.1 o posterior para relay):
- ID de juego A:
- ID de juego B:
- Versión/región de PES 6 A:
- Versión/región de PES 6 B:
- IP/DNS del VPS (no la publiques en capturas):
- Fecha de prueba:

## Pruebas

| Prueba | Resultado | Notas |
|---|---|---|
| Contenedor se inicia sin errores | Pendiente | |
| Puertos 27312 TCP/UDP accesibles | Pendiente | |
| Puertos 27313 TCP/UDP accesibles | Pendiente | |
| Ambos clientes PPSSPP se conectan al servidor | Pendiente | |
| Ambos pueden entrar al mismo modo/sala Ad Hoc | Pendiente | |
| El juego inicia una partida entre los dos | Pendiente | |
| La partida se mantiene estable | Pendiente | |
| Prueba entre redes diferentes | Pendiente | |
| Prueba usando datos móviles | Pendiente | |
| Prueba con otro juego Ad Hoc | Pendiente | |

## Diagnóstico básico

- Si no conecta: comprueba la IP/DNS pública del VPS, el estado del contenedor, el firewall del VPS y el firewall del proveedor.
- Si conecta al servicio pero no ve salas: comprueba el ID de juego y la compatibilidad del modo Ad Hoc.
- Si ve al otro jugador pero la partida falla: prueba primero otro juego Ad Hoc conocido y registra las versiones exactas de PPSSPP y PES 6.
- No compartas públicamente contraseñas, claves SSH ni registros que incluyan datos privados.

## Estado de verificación

- Protocolo: documentado por PPSSPP como `aemu_postoffice` relay en PPSSPP 1.20.1+.
- ID europeo `ULES00476`: presente en la base de datos upstream consultada.
- Partida real de PES 6: **no probada todavía**.
