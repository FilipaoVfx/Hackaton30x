# Guion de demo (5 minutos)

> Paso a paso exacto. **Nadie improvisa.** Asegura que el flujo cumpla el criterio del jurado: _"el jurado recorre el flujo sin ayuda"_.

⏱️ **Total: 5 minutos.** Cronometrar en el ensayo.

---

## Antes de empezar (checklist)
- [ ] Demo corriendo en local (seed + run ya ejecutado).
- [ ] Internet NO requerido (o plan B listo).
- [ ] Datos semilla cargados desde `datasets/`.
- [ ] Pestaña/pantalla lista en el primer paso.
- [ ] Video de respaldo abierto en otra pestaña (plan B).

---

## Minuto 0:00–0:45 · El gancho (Problema)
> "Colsubsidio paga por cientos de leads. Pero muchos no pueden comprar y muchos no son afiliados — y por ley, el 90% de las ventas debe ser a afiliados. El asesor pierde horas filtrando a mano. Los leads orgánicos, en cambio, convierten muy bien. ¿La diferencia? Llegan **calificados**."

## Minuto 0:45–1:15 · La idea (Solución)
> "Construimos **Expediente Inteligente**: no calificamos personas, construimos un expediente vivo que perfila al lead **antes** de llegar al asesor. Un solo cerebro para todos los canales."

## Minuto 1:15–3:45 · La demo en vivo

> Se usan **perfiles reales** de la base ([`../datasets/leads_muestra.json`](../datasets/leads_muestra.json)), no leads inventados. Cada uno trae `_ground_truth` para validar en vivo.

**Escenario A — Lead que cierra (HOT):** usar `lead_R002` (afiliado, Básico, 1–1.5 SMLV, consolidó de verdad).
1. "Entra un lead por un canal." → mostrar lead entrando.
2. "El sistema ya sabe de dónde vino y, por ser **afiliado**, precarga su perfil desde la caja." → mostrar precarga.
3. "Pregunta **solo lo que falta**, sin interrogatorio." → responder 1-2 preguntas.
4. "Da un **score con su razón**: encaja con el perfil ICP del proyecto." → mostrar HOT.
5. "Lo **rutea al asesor** con la recomendación de proyecto (brochure + 360)." → mostrar ruteo.
6. "Validación: este perfil **sí compró** en la realidad → el scorer lo confirma HOT."

**Escenario B — No afiliado (regla 90/10):** usar `lead_R008` (no afiliado, llega 100% vacío).
7. "El no afiliado llega **sin datos** — Colsubsidio solo conoce a sus afiliados. Se distingue desde el inicio por el cupo 90/10 y se le pide lo esencial o se rutea a afiliación."

**Escenario C — En riesgo → nutrición:** usar `lead_R011` (afiliado que **desistió**).
8. "En vez de perderlo, entra a **nutrición** para volver más adelante. Ese es el propósito social de Colsubsidio."

## Minuto 3:45–4:30 · Por qué escala (Impacto)
> "Menos CPL desperdiciado, más horas del asesor en cierres, y nadie se pierde: los que no pueden hoy se nutren. Y escala: agregar WhatsApp o el contact center es agregar un adaptador, no reescribir el sistema."

## Minuto 4:30–5:00 · Cierre
> "En una frase: hacemos que los leads pagos se parezcan a los orgánicos. Gracias — ¿preguntas?"

---

## Reglas del ensayo
- Cronometrar. Si pasa de 5 min, recortar el escenario C.
- El que presenta **no** es el que maneja el teclado (uno habla, otro conduce).
- Practicar la transición HOT → COLD: es el momento que muestra el propósito social.
- Tener listas las respuestas de [`../docs/judges.md`](../docs/judges.md) para las preguntas.

## Plan B
Si la demo en vivo falla: cambiar al **video pregrabado** sin drama, narrar encima. Nunca pelear con un bug frente al jurado.
