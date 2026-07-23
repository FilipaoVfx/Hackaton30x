# recursos/ — insumos oficiales del Reto Vivienda

Recursos entregados por Colsubsidio x 30X para el reto. **Base anonimizada** (sin cédulas ni datos identificables, según la guía oficial).

> Análisis y hallazgos derivados de estos archivos → [`../docs/data-insights.md`](../docs/data-insights.md).

## Archivos

| Archivo | Qué es |
|---|---|
| `hackathon_VIVIENDA.xlsx` | Base de **4.142 compradores** (2024–2026), 27 columnas |
| `Buyer_Person.pptx` | Buyer persona por proyecto (22 slides, corte 15/01/2026) |
| `Links_brochures.xlsx` | 20 proyectos con brochure (heyzine) + tour 360 |
| `Como_usar_los_recursos.docx` | Guía oficial y diccionario de variables |

## Diccionario de columnas — `hackathon_VIVIENDA.xlsx`

Hoja `CV_SSS_VIV_PENETRACION_PERFIL_C`:

| Columna | Descripción |
|---|---|
| `NOMBRE_PROYECTO`, `ETAPA`, `CODIGO_PLAN_SIV`, `PLAN_VIVIENDA`, `INMUEBLE` | Proyecto, etapa, código e inmueble |
| `FEC_OPCION` | Fecha en que compró la persona |
| `FECHA_DESISTIMIENTO` | Si está vacía → compra vigente / terminó bien. Si tiene fecha → desistió |
| `ENT_CREDITO` | Entidad financiera del crédito |
| `MEDIO` | Canal por el que se enteró (valla, referido, web, whatsapp, etc.) |
| `VLR_VIVIENDA` | Valor de la vivienda. ⚠️ **Formato con ceros de más**: `523.620` ≈ 523 millones COP |
| `PROCESO` | Estado del proceso (todas las filas: `VENTA`) |
| `PERIODO`, `PERIODO_AFILIADO` | Periodo (año-mes) |
| `ESTADO_AFILIACION` | AFILIADO / NO AFILIADO / ESTUVO AFILIADO / GRUPO_FAMILIAR |
| `SEGMENTO_POBLACIONAL` | Básico / Medio / Alto / Joven (ver definición abajo) |
| `CATEGORIA` | A / B / C |
| `RANGO_SALARIAL` | Rango en SMLV (ej. "Entre 1 y 1.5 SMLV") |
| `RANGO_EDAD` | Rango de edad. ⚠️ formatos duplicados a normalizar |
| `NO_GRUPO_FAMILAR` | Tamaño del grupo familiar |
| `NO_BENEFICIARIOS_CUOTA_MONETARIA` | Beneficiarios de cuota monetaria |
| `NOMBRE_EMPRESA_PRINCIPAL` | Empresa empleadora del afiliado |
| `PIRAMIDE_1_FINAL`, `PIRAMIDE_2_FINAL`, `PIRAMIDE_NUEVA` | Pirámide de empresas (Platinum, VIP Estándar, Colsubsidio, etc.) |
| `RANKING_GRUPO`, `RANKING_FILIAL`, `EMPRESA_FOCO` | Ranking y marca de empresa foco |

> ⚠️ Solo los **afiliados** tienen poblado segmento/categoría/salario/edad. Los no-afiliados vienen vacíos (ver [`../docs/data-insights.md`](../docs/data-insights.md)).

## Segmentación de la caja (definición oficial)

| Segmento | Definición |
|---|---|
| **Básico** | Hasta 1.44 SMLV, con personas a cargo registradas |
| **Medio** | Entre 1.44 y 20 SMLV, con grupo familiar |
| **Alto** | Más de 20 SMLV |
| **Joven** | Menor de 39 años sin personas a cargo |

**Segmentación familiar (DANE):** monoparental · nuclear ampliada · monoparental ampliada · pareja conyugal.

## Buyer persona — `Buyer_Person.pptx`
Características de los **compradores actuales** por proyecto. Variables por slide: % afiliación, género, rangos salariales, rangos de edad, segmentación de caja, segmentación familiar, personas a cargo, estrato, pirámide de empresas, ubicación, entidad financiera. Incluye versiones agrupadas: **municipios norte** y **municipios sur**, más **Total**, **Bogotá** y **Maiporé**.

## Proyectos — `Links_brochures.xlsx`
20 proyectos con link a brochure (heyzine flip-book) y tour 360 (shape.com.co, umbra3d, net-fs). Versión estructurada y consumible → [`../datasets/proyectos_reto.json`](../datasets/proyectos_reto.json).

## Uso responsable
Datos de negocio de Colsubsidio provistos para el reto. Anonimizados a nivel de persona. Usar solo en el contexto del hackathon.
