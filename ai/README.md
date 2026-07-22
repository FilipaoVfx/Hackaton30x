# ai/

Capa de IA: integración con el LLM para **conversar y extraer**, no para decidir elegibilidad.

## Responsabilidad
- Ejecutar los prompts versionados en [`../prompts/`](../prompts/).
- **Extraer** datos estructurados de la conversación (perfil del lead).
- **Generar** la pregunta del siguiente hueco de forma natural.
- **Resumir** el expediente para el asesor.

## Qué la IA NO hace
- ❌ No calcula elegibilidad de subsidios (eso es del Motor de Subsidios, determinista).
- ❌ No inventa datos: si no sabe, marca el campo como faltante para preguntarlo.

## Prompts
Todos los prompts viven en [`../prompts/`](../prompts/) y están **versionados**. Cada uno documenta entrada, salida esperada y ejemplo.

## Estado
🚧 Scaffold.
