# Roadmap

> Qué está hecho, qué es MVP para la demo, y qué viene después.

## Fase 0 — Fundación ✅
- [x] Definición del problema (negocio) → [`problem.md`](problem.md)
- [x] Filosofía de la solución → [`solution.md`](solution.md)
- [x] Arquitectura y modelo canónico → [`architecture.md`](architecture.md)
- [x] Diseño del motor de scoring → [`scoring-engine.md`](scoring-engine.md)
- [x] Datasets mock → [`../datasets/`](../datasets/)

## Fase 1 — MVP (lo que la demo DEBE mostrar) 🎯
- [ ] Crear expediente desde un lead
- [ ] Perfilamiento conversacional (pregunta solo los huecos)
- [ ] Motor de subsidios (VIS/VIP, Mi Casa Ya, SFV) determinista
- [ ] Motor de scoring con desglose y razón
- [ ] Ruteo HOT / WARM / COLD
- [ ] Recomendación de 1-3 proyectos
- [ ] Recorrido completo sin intervención humana

> Definición exacta del MVP → [`../planning/mvp.md`](../planning/mvp.md)

## Fase 2 — Escala multicanal 🔌
- [ ] Adaptadores: Meta, Google Ads, WhatsApp, web, contact center
- [ ] Demostrar el mismo cerebro con ≥2 canales reales
- [ ] Panel del asesor con cola priorizada

## Fase 3 — Nutrición 🌱
- [ ] Flujo de nutrición para leads COLD
- [ ] Reglas de reactivación (vuelve en X meses / al cambiar condiciones)
- [ ] Métricas de reconversión

## Fase 4 — Integraciones reales (fuera del hackathon) 🚧
- [ ] CRM real de Colsubsidio
- [ ] DataCrédito (situación crediticia real)
- [ ] Bot actual del contact center
- [ ] Aprobación de crédito / firma

> Estas quedan **explícitamente fuera** del alcance del reto. En el MVP se simulan con mocks.

## Métricas de éxito
- Conversión de lead **pago** acercándose a la de lead **orgánico**.
- Reducción de horas del asesor por lead cerrado.
- % de leads HOT que efectivamente agendan visita.
- % de leads COLD reconvertidos vía nutrición.
