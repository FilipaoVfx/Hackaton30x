# backend/

El **cerebro**. Orquesta ingesta, enriquecimiento, perfilamiento, subsidios, scoring y ruteo.

## Responsabilidad
- Recibir leads normalizados desde los adaptadores de canal.
- Coordinar el **Perfilador** (IA), el **Motor de Subsidios** (reglas) y el **Motor de Scoring**.
- Persistir el **expediente vivo** en la base de datos.
- Exponer la lógica vía la API en [`../api/`](../api/).

## Módulos previstos
| Módulo | Qué hace | Dónde |
|---|---|---|
| Adaptadores | Traducen cada canal al Lead Canónico | `channels/` |
| Enriquecimiento | Infiere afiliación/ingreso de las señales | `enrichment/` |
| Perfilador | Conversa vía LLM, llena huecos | usa [`../prompts/`](../prompts/) |
| Motor de Subsidios | Reglas VIS/VIP, Mi Casa Ya, SFV (determinista) | `subsidies/` |
| Motor de Scoring | Combina dimensiones → prioridad + razón | `scoring/` |
| Ruteo | HOT/WARM/COLD → asesor/nutrición | `routing/` |

## Principio
**La IA conversa; las reglas deciden.** Subsidios y elegibilidad son deterministas y auditables. Ver [`../docs/scoring-engine.md`](../docs/scoring-engine.md).

## Estado
🚧 Scaffold.
