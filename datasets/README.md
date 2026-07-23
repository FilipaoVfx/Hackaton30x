# datasets/

Datos **reales**, derivados de la base oficial del reto ([`../recursos/hackathon_VIVIENDA.xlsx`](../recursos/), 4.142 compradores). **Cero data sintética.**

| Archivo | Qué es | Origen |
|---|---|---|
| `perfil_icp.json` | Perfil del comprador que sí cierra (ICP): distribuciones de afiliación, segmento, salario, edad, crédito, desistimiento | Agregado real de la base |
| `canal_priors.json` | P(afiliado) por canal (`MEDIO`) — sesga la inferencia en el enriquecimiento | Agregado real de la base |
| `segmentacion_caja.json` | Segmentación oficial de Colsubsidio (Básico/Medio/Alto/Joven) + familiar DANE | Guía oficial del reto |
| `leads_muestra.json` | Muestra de perfiles reales usados como leads de demo/validación, con `_ground_truth` (consolidado/desistido) | Muestreo real de la base (seed fijo) |
| `proyectos_reto.json` | 20 proyectos reales con brochure (heyzine) + tour 360 | `../recursos/Links_brochures.xlsx` |

## Regeneración
Los agregados y la muestra se derivan de la base con un script determinista (seed 42). No se editan a mano: se regeneran desde [`../recursos/`](../recursos/).

## Nota sobre subsidios
Los programas VIS/VIP, Mi Casa Ya y SFV son política real, pero **la base no trae montos de subsidio**. Ningún archivo aquí inventa cifras de subsidio: la elegibilidad se marca por reglas y el monto queda "a consultar en fuente oficial". Ver [`../docs/scoring-engine.md`](../docs/scoring-engine.md).
