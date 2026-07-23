# MVP — qué DEBE estar listo para que la demo funcione

> Regla: si no está en esta lista, **no bloquea la demo**. Si está, es **innegociable**.

## Criterio de éxito de la demo
> El jurado recorre el flujo completo **sin ayuda**, en ~2 minutos, y ve: expediente → perfilamiento → subsidios → score con razón → recomendación → ruteo.

## Must-have (sin esto no hay demo)

- [ ] **Ingesta de un lead** desde el modelo canónico (al menos 1 canal real + carga desde `datasets/leads_muestra.json`, perfiles reales).
- [ ] **Perfilador conversacional** que pregunta solo los huecos (3-4 preguntas máx).
- [ ] **Segmentación + elegibilidad** determinista (segmentos oficiales de la caja, `datasets/segmentacion_caja.json`). Subsidios: marcar aplicables, sin inventar montos (la base no los trae).
- [ ] **Motor de scoring** con desglose + `razon` en texto claro (pesos de `docs/scoring-engine.md`).
- [ ] **Ruteo** HOT / WARM / COLD visible.
- [ ] **Recomendación** de 1-3 proyectos desde `datasets/proyectos_reto.json` (con brochure + 360).
- [ ] **Una pantalla** donde todo esto se ve (aunque sea simple).
- [ ] **Un comando** que deja la demo corriendo (seed + run).

## Escenarios que la demo debe cubrir
1. **Lead HOT:** afiliado, segmento Básico, 1–1.5 SMLV (perfil ICP) → va al asesor. (ej. real `lead_R002`)
2. **Lead en riesgo → nutrición:** afiliado que desistió; no se descarta, se nutre. (ej. real `lead_R011`)
3. **Lead no afiliado:** se distingue desde el inicio (regla 90/10), llega 100% vacío. (ej. real `lead_R008`)

## Definición de "terminado" (Definition of Done)
- El flujo corre **end-to-end sin intervención**.
- El score muestra **su razón**.
- No hay pasos manuales ocultos para que "funcione en la demo".

## Fuera del MVP (ver [`nice-to-have.md`](nice-to-have.md))
Multicanal completo, panel avanzado del asesor, animaciones, integración WhatsApp real.
