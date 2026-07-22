# MVP — qué DEBE estar listo para que la demo funcione

> Regla: si no está en esta lista, **no bloquea la demo**. Si está, es **innegociable**.

## Criterio de éxito de la demo
> El jurado recorre el flujo completo **sin ayuda**, en ~2 minutos, y ve: expediente → perfilamiento → subsidios → score con razón → recomendación → ruteo.

## Must-have (sin esto no hay demo)

- [ ] **Ingesta de un lead** desde el modelo canónico (al menos 1 canal real + carga desde `datasets/leads.csv`).
- [ ] **Perfilador conversacional** que pregunta solo los huecos (3-4 preguntas máx).
- [ ] **Motor de subsidios** determinista (VIS/VIP, Mi Casa Ya, SFV) leyendo `datasets/subsidios.json`.
- [ ] **Motor de scoring** con desglose + `razon` en texto claro.
- [ ] **Ruteo** HOT / WARM / COLD visible.
- [ ] **Recomendación** de 1-3 proyectos desde `datasets/proyectos.json`.
- [ ] **Una pantalla** donde todo esto se ve (aunque sea simple).
- [ ] **Un comando** que deja la demo corriendo (seed + run).

## Escenarios que la demo debe cubrir
1. **Lead HOT:** afiliado, ingreso alcanza, aplica subsidios → va al asesor. (ej. `lead_0001`)
2. **Lead COLD:** no puede comprar hoy → entra a nutrición, **no se descarta**. (ej. `lead_0005`)
3. **Lead no afiliado:** se distingue desde el inicio (regla 90/10). (ej. `lead_0004`)

## Definición de "terminado" (Definition of Done)
- El flujo corre **end-to-end sin intervención**.
- El score muestra **su razón**.
- No hay pasos manuales ocultos para que "funcione en la demo".

## Fuera del MVP (ver [`nice-to-have.md`](nice-to-have.md))
Multicanal completo, panel avanzado del asesor, animaciones, integración WhatsApp real.
