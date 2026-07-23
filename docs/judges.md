# Guía para jurados

> Le facilitamos la vida al jurado. Este recorrido toma **~2 minutos** y muestra todo el valor.

## Cómo evaluar el proyecto

```
1. Entrar a la app.
2. Crear un expediente (o disparar un lead simulado).
3. Ver el score y su razón.
4. Ver los subsidios aplicables.
5. Ver las recomendaciones de proyecto.

⏱️ Tiempo estimado: 2 minutos.
```

## Recorrido detallado

| Paso | Qué hacer | Qué observar |
|---|---|---|
| 1 | Abrir la app / demo | El lead entra por un canal (ej. Meta) |
| 2 | Crear expediente | El sistema **precarga** lo que infiere del canal |
| 3 | Responder 2-3 preguntas | **No es un interrogatorio** — pregunta solo huecos |
| 4 | Ver subsidios | VIS/VIP, Mi Casa Ya, SFV calculados por reglas |
| 5 | Ver score | HOT / WARM / COLD **con su razón explícita** |
| 6 | Ver ruteo | HOT → asesor · COLD → nutrición (no se descarta) |
| 7 | Ver recomendación | 1-3 proyectos acordes, no todo el catálogo |

## Qué buscar (criterios del reto)

- [ ] **Recibe leads de distintas fuentes** y no los trata a todos igual → ver [modelo canónico](architecture.md).
- [ ] **Distingue afiliado / no afiliado** desde el inicio → filtro 90/10.
- [ ] **Valida o infiere capacidad de compra** (ingreso, subsidios, vivienda, crédito) sin interrogatorio.
- [ ] **Prioriza:** listos al asesor, no-listos a nutrición.
- [ ] **Recomienda proyectos** acordes al perfil.
- [ ] **Se recorre sin intervención** del equipo.
- [ ] **Escala más allá de un canal** → adaptadores.

## Preguntas frecuentes del jurado

**¿Esto reemplaza al asesor?**
No. Le entrega el lead **ya calificado** para que dedique su tiempo a cerrar, no a explorar.

**¿Y los que no pueden comprar?**
No se descartan. Entran a **nutrición** para volver más adelante — es parte del propósito social de Colsubsidio.

**¿La IA inventa subsidios?**
No. La IA **conversa y extrae**; la elegibilidad de subsidios la calculan **reglas deterministas** auditables. Ver [`scoring-engine.md`](scoring-engine.md).

**¿Está integrado con el CRM real / DataCrédito?**
La **integración en vivo** con CRM/DataCrédito está fuera del alcance del reto y se simula. Pero los datos **no son inventados**: usamos la **base real anonimizada** de 4.142 compradores ([`../recursos/`](../recursos/)) como evidencia y para derivar el ICP y los priors ([`../datasets/`](../datasets/)). Lo que demostramos es la **inteligencia de perfilamiento**.

**¿Cómo escala a más canales?**
Un solo cerebro, muchas bocas. Agregar un canal = agregar un adaptador al modelo canónico. Ver [`architecture.md`](architecture.md).

## Contexto rápido
- Problema completo → [`problem.md`](problem.md)
- Solución / filosofía → [`solution.md`](solution.md)
- Decisiones de producto → [`../DECISIONS.md`](../DECISIONS.md)
