# frontend/

Interfaz de usuario del Expediente Inteligente.

## Responsabilidad
- Vista del **perfilador conversacional** (chat / formulario adaptativo que pregunta solo los huecos).
- **Panel del asesor**: cola de leads priorizada (HOT / WARM / COLD) con el expediente y su razón.
- Vista de **recomendación de proyectos**.

## Stack (por definir)
> Decidir en las primeras horas. Sugerencia: framework SPA + componentes simples. Priorizar que la **demo se recorra sin ayuda**.

## Contrato con el backend
Consume la API definida en [`../api/`](../api/). No contiene lógica de scoring ni de subsidios: solo **presenta** el expediente que arma el backend.

## Estado
🚧 Scaffold. Ver MVP en [`../planning/mvp.md`](../planning/mvp.md).
