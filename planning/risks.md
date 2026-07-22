# Riesgos

> Identificados temprano para no descubrirlos a las 3am.

| # | Riesgo | Impacto | Prob. | Mitigación |
|---|---|---|---|---|
| 1 | La demo falla en vivo (red, API caída) | Alto | Media | **Plan B:** video pregrabado + capturas en `docs/assets/`. Demo con datos locales, sin depender de internet. |
| 2 | Scope creep: se construye de más y no cierra el MVP | Alto | Alta | Congelar el [`mvp.md`](mvp.md). Nada de `nice-to-have` hasta MVP verde. |
| 3 | El LLM alucina subsidios / elegibilidad | Alto | Media | **La IA no decide elegibilidad.** Reglas deterministas. La IA solo conversa/extrae. |
| 4 | Perfilamiento se siente interrogatorio | Medio | Media | Máx. 3-4 preguntas, inferir primero, explicar el "por qué" de cada pregunta. |
| 5 | Datos de subsidios incorrectos (umbrales, montos) | Medio | Alta | Marcar todo como mock/ilustrativo. Umbrales en config, no hardcode. Disclaimer en `datasets/subsidios.json`. |
| 6 | Integración con canal real consume el tiempo | Alto | Media | Priorizar carga desde CSV. Canal real es 🟡, no 🔴. |
| 7 | Nadie ensayó el pitch | Medio | Media | Ensayo obligatorio la noche antes. Guion en [`demo-script.md`](demo-script.md). |
| 8 | Merge conflicts / caos de git | Medio | Media | Ramas por feature, PRs pequeños, main siempre desplegable. |
| 9 | El jurado no entiende el valor en 2 min | Alto | Baja | README vende, [`../docs/judges.md`](../docs/judges.md) guía el recorrido. |

## Regla anti-pánico
Si algo se rompe faltando <3h: **volver al último estado que funcionaba** (git), no improvisar features nuevas.
