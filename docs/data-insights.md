# Insights de datos — evidencia del Reto Vivienda

> Análisis de los recursos oficiales del reto ([`../recursos/`](../recursos/)). Esto convierte el proyecto de "mock" a **evidencia real**: cada decisión del scoring se apoya en 4.142 compradores reales de Colsubsidio (2024–2026).

## Fuentes
- **`hackathon_VIVIENDA.xlsx`** — base anonimizada de **4.142 compradores**, 27 columnas, sin datos identificables (no cédulas).
- **`Buyer_Person.pptx`** — buyer persona por proyecto (22 slides, corte 15/01/2026).
- **`Links_brochures.xlsx`** — 20 proyectos con brochure + tour 360.
- **`Como_usar_los_recursos.docx`** — guía oficial y diccionario de variables.

---

## 1. La tesis del reto está probada en la data 🎯

El reto afirma: _"los leads orgánicos convierten mejor porque llegan más calificados"_. La base lo confirma. **% de afiliados entre compradores reales, por canal (`MEDIO`):**

| Canal | % afiliados | Ventas |
|---|---|---|
| **Página web (orgánico)** | **83.5%** | 91 |
| Ferias empresariales | 83.0% | 282 |
| Activación | 78.9% | 369 |
| Contact Center | 78.7% | 47 |
| Whatsapp | 74.4% | 125 |
| Redes Sociales | 73.4% | 124 |
| Banderas / señalización | 72.7% | 1797 |
| Valla | 68.4% | 158 |

> El canal **orgánico (web) trae la mayor proporción de afiliados** — justo la población que cumple la regla 90/10. Los canales digitales pagos (Redes, Whatsapp) traen más no-afiliados. La brecha que el reto pide cerrar **existe y es medible**.
> _(Caveat: web n=91, muestra pequeña; tendencia consistente, no tomar el número al decimal.)_

## 2. El insight de arquitectura, confirmado al 100% 🔑

**Colsubsidio tiene perfil rico solo de los afiliados. Del no-afiliado no sabe nada.**

| `ESTADO_AFILIACION` | Total | Sin dato de salario |
|---|---|---|
| AFILIADO(A) | 3.020 | **0%** |
| NO AFILIADO(A) | 1.042 | **100%** |
| ESTUVO AFILIADO(A) | 47 | 100% |
| GRUPO_FAMILIAR | 33 | 100% |

Los 1.122 registros con perfil vacío (salario, segmento, categoría, edad) son **exactamente** los no-afiliados. Correlación perfecta.

**Implicación directa para el perfilador:**
- **Lead afiliado** → enriquecer al instante desde los registros de la caja (ingreso, segmento, categoría, edad, grupo familiar). **Casi cero preguntas.**
- **Lead no-afiliado** → hoja en blanco: preguntar lo esencial **o** rutear primero a afiliación.

Esto valida la doctrina **"inferir antes de preguntar"** con datos reales, no con intuición.

## 3. Segmentación oficial de la caja (reemplaza supuestos)

De la guía oficial — estas son las 4 categorías reales de Colsubsidio:

| Segmento | Definición |
|---|---|
| **Básico** | Gana hasta **1.44 SMLV** y tiene personas a cargo registradas |
| **Medio** | Gana entre **1.44 y 20 SMLV** y tiene grupo familiar |
| **Alto** | Gana más de **20 SMLV**, con o sin grupo familiar |
| **Joven** | Menor de **39 años** sin personas a cargo registradas |

**Segmentación familiar (variables DANE):** monoparental · nuclear ampliada · monoparental ampliada · pareja conyugal.

> El motor de scoring debe usar **estas** categorías, no rangos inventados. Ver actualización pendiente en [`scoring-engine.md`](scoring-engine.md).

## 4. Perfil del comprador que sí cierra (el ICP)

El "orgánico de referencia" al que hay que acercar los leads pagos:

- **Ingreso:** 47% gana **1–1.5 SMLV**; ~62% por debajo de 2 SMLV → foco **VIS/VIP**.
- **Segmento:** Básico (1.440) > Medio (871) > Joven (708).
- **Edad:** domina **20–35 años**.
- **Hogar:** ~43% con **cero personas a cargo**; ~24% Joven (buyer persona).
- **Crédito (`ENT_CREDITO`):** Colsubsidio (1.397) > Davivienda (915) > FNA (461) > Bancolombia (322).

## 5. Desistimiento: baseline 13.3%

550 de 4.142 registros tienen `FECHA_DESISTIMIENTO` (compra que no se consolidó).

> ⚠️ **Caveat:** los 550 desistimientos están todos etiquetados `MEDIO = "Sin Informacion"`, así que **no** se pueden atribuir limpio a un canal. Úsese como **tasa base de churn** (13.3%), no como comparación entre canales. La guía confirma: _"Fecha de desistimiento: si está vacía, la compra sigue vigente o terminó bien."_

## 6. Catálogo real de proyectos

**26 proyectos** en la base; **20 con brochure y/o tour 360** → [`../datasets/proyectos_reto.json`](../datasets/proyectos_reto.json). Ubicaciones: Bogotá, Ciudadela Maiporé, Ciudadela Calle 80, Tocancipá, Chía, Ricaurte, Girardot, Ubaté.

> El **recomendador** entrega, junto al proyecto sugerido, el **brochure** (heyzine) y el **tour 360** reales.

---

## Cómo esto recalibra el producto

| Componente | Antes (mock) | Ahora (con data real) |
|---|---|---|
| Scoring afiliación | Peso supuesto | Confirmado: web 83.5% vs redes 73% → canal es señal de calidad |
| Enriquecimiento | Idea | Regla dura: afiliado = data completa; no-afiliado = vacío |
| Segmentos | Rangos inventados | 4 categorías oficiales (Básico/Medio/Alto/Joven) |
| Recomendador | 4 proyectos ficticios | 20 proyectos reales + brochure + 360 |
| Nutrición | Genérica | Priorizar reconversión donde el ICP calza (1–1.5 SMLV, 20–35, VIS) |

## Limpieza de datos pendiente
- **`VLR_VIVIENDA`** trae ceros de más: `523.620` = ~523 millones COP. Recortar antes de usar.
- **`RANGO_EDAD`** tiene formatos duplicados (`"20 a 35 años"` vs `"20 - 35 años"`) → normalizar.
- **`ENT_CREDITO`** tiene Colsubsidio escrito de dos formas → unificar.

> Diccionario completo de columnas → [`../recursos/README.md`](../recursos/README.md).
