# database/

Persistencia del **expediente vivo** y su historia.

## Responsabilidad
- Guardar cada expediente (perfil, score, subsidios, documentos, siguiente acción).
- Guardar el **timeline**: qué se infirió, qué se preguntó, cómo evolucionó el score.
- Servir de fuente para el panel del asesor y el flujo de nutrición.

## Esquema
Ver [`schema.sql`](schema.sql). Entidades principales:
- `leads` — el lead canónico crudo por canal.
- `expedientes` — el estado vivo (score, prioridad, siguiente acción).
- `eventos` — timeline del expediente (auditable).
- `subsidios_aplicables` — resultado del motor de subsidios por expediente.

## Nota
El CRM real está **fuera de alcance**: esta base **simula** el CRM para la demo. Datos semilla en [`../datasets/`](../datasets/) y seeder en [`../scripts/`](../scripts/).

## Estado
🚧 Scaffold — esquema propuesto.
