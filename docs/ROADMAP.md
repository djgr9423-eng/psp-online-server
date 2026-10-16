# Hoja de ruta

## Fase 1 — Identificar el entorno

- [ ] Confirmar que ambos dispositivos son PSP originales (no emuladores).
- [ ] Anotar la región/versión de PES 6 en cada consola.
- [ ] Confirmar si las consolas tienen firmware personalizado y qué complementos son compatibles.
- [ ] Elegir una solución de red existente que admita PSP real.

## Fase 2 — Verificar el protocolo

- [ ] Leer la documentación y el código del servidor candidato.
- [ ] Confirmar el protocolo que espera el cliente de PSP.
- [ ] Confirmar los puertos TCP/UDP requeridos y si el servidor necesita estado.
- [ ] Revisar licencia, mantenimiento y requisitos de ejecución.
- [ ] No desplegar una implementación genérica que no hable el protocolo esperado.

## Fase 3 — Preparar alojamiento

- [ ] Elegir un VPS Linux con dirección pública y soporte UDP si el protocolo lo requiere.
- [ ] Configurar firewall con los puertos documentados por el proyecto elegido.
- [ ] Usar un usuario sin privilegios administrativos para ejecutar el servicio.
- [ ] Documentar cómo actualizar, detener y consultar los registros.

## Fase 4 — Pruebas con PES 6

- [ ] Confirmar que ambos jugadores pueden llegar al servidor.
- [ ] Comprobar descubrimiento de la sala y entrada de ambos jugadores.
- [ ] Probar una partida completa.
- [ ] Repetir con redes diferentes y con datos móviles.
- [ ] Registrar errores, latencia y resultados.

## Criterio de éxito

Dos PSP originales, desde redes diferentes, pueden encontrarse y completar una partida de PES 6 usando una configuración documentada y repetible.
