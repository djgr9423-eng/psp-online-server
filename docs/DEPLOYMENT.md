# Despliegue: requisitos previos

Este documento no contiene todavía comandos de instalación porque primero debemos elegir y verificar una implementación que sea compatible con el protocolo requerido por PES 6.

## Antes de contratar o configurar un servidor

1. Identifica el proyecto de servidor y su licencia.
2. Verifica que admite el cliente/complemento elegido para una PSP original.
3. Lee qué sistema operativo, puertos y dependencias exige.
4. Comprueba si necesita una dirección IPv4 pública o si admite otras configuraciones de red.
5. Anota los puertos exactos desde la documentación oficial del proyecto.

## Red y datos móviles

Las conexiones de operadores móviles pueden usar CGNAT. Por eso, alojar el servidor en uno de los teléfonos normalmente no equivale a tener un servidor público accesible. Un VPS con dirección pública suele ser más apropiado, siempre que el protocolo y los puertos requeridos estén soportados.

## Seguridad

- Abre únicamente los puertos que la documentación del servidor indique.
- No ejecutes el servicio como root si no es imprescindible.
- Mantén actualizado el sistema operativo y el software.
- No publiques secretos en GitHub.
- No copies configuraciones de puertos de otros juegos sin verificar que correspondan a esta implementación.

## Estado

**Pendiente:** seleccionar el servidor compatible, confirmar sus requisitos y añadir instrucciones reproducibles para esa implementación concreta.
