# PSP Online Server

Proyecto experimental para investigar cómo conectar dos consolas **PSP originales** a través de Internet y probar **PES 6 para PSP**.

> **Estado:** documentación inicial. Este repositorio todavía no contiene un servidor compatible con el protocolo de PES 6 y no debe considerarse listo para partidas reales.

## Objetivo

- Investigar soluciones existentes para multijugador *ad hoc* de PSP a través de Internet.
- Identificar qué cliente o complemento requiere cada solución en una PSP original.
- Verificar compatibilidad específica con PES 6 y sus versiones/regiones.
- Documentar pruebas entre redes distintas, incluidas conexiones de datos móviles.
- Evitar implementar un protocolo nuevo incompatible con el juego cuando ya existe una solución adecuada.

## Importante: servidor no significa compatibilidad automática

PES 6 no se conectará a cualquier servidor web o UDP genérico. Los dos jugadores necesitan una solución compatible con el protocolo de red que utiliza el juego, y el servidor debe implementar el protocolo esperado por el cliente/complemento. Este proyecto no afirma todavía esa compatibilidad.

## Investigación inicial

- [PPSSPP: documentación y comunidad](https://www.ppsspp.org/)
- [Kethen/aemu_postoffice](https://github.com/Kethen/aemu_postoffice) — investigar su protocolo, estado y compatibilidad antes de reutilizarlo.
- [Kethen/aemu releases](https://github.com/Kethen/aemu/releases) — revisar requisitos y compatibilidad del cliente antes de instalarlo.

Los enlaces anteriores son referencias para investigar, no una garantía de que funcionen con PES 6 o con una PSP original.

## Plan de trabajo

1. Confirmar la versión exacta de PES 6 y que ambos jugadores tienen una copia compatible.
2. Identificar el sistema de juego en red adecuado para PSP original.
3. Verificar el protocolo y los requisitos del servidor existente.
4. Preparar una configuración reproducible de despliegue.
5. Probar primero con dos clientes y registrar resultados, errores y latencia.
6. Publicar instrucciones verificadas cuando exista una combinación funcional.

Consulta [docs/ROADMAP.md](docs/ROADMAP.md), [docs/PES6-TESTS.md](docs/PES6-TESTS.md) y [docs/DEPLOYMENT.md](docs/DEPLOYMENT.md).

## Seguridad

- No subas contraseñas, tokens, claves privadas ni archivos de configuración con secretos.
- No abras puertos de red hasta identificar el protocolo y limitar el acceso cuando sea posible.
- Usa únicamente software y copias de juegos que tengas derecho a utilizar.

## Licencia

Aún no se ha elegido una licencia. Antes de reutilizar código de otros proyectos, revisa sus licencias y requisitos de atribución.
