# api/

Contrato de la API entre frontend y backend. **Un solo cerebro, muchas bocas** → la API es la interfaz del cerebro.

## Endpoints propuestos

| Método | Ruta | Qué hace |
|---|---|---|
| `POST` | `/leads` | Ingesta de un lead (desde cualquier adaptador de canal) |
| `POST` | `/expedientes/:id/mensaje` | Envía respuesta del lead; devuelve la siguiente pregunta o el score |
| `GET` | `/expedientes/:id` | Estado completo del expediente (perfil, score, subsidios, recomendaciones) |
| `GET` | `/expedientes?prioridad=HOT` | Cola priorizada para el panel del asesor |
| `POST` | `/expedientes/:id/rutear` | Ejecuta el ruteo (asesor / nutrición) |

## Ejemplo — respuesta de `GET /expedientes/:id`

```json
{
  "id": "exp_0001",
  "fuente": "meta_ads",
  "perfil": { "afiliado": true, "ingreso_smmlv": 3, "tiene_vivienda": false },
  "score_global": 0.82,
  "prioridad": "HOT",
  "confidence": 0.75,
  "razon": "Afiliada · ingreso 3 SMMLV cubre cuota · aplica Mi Casa Ya y SFV",
  "subsidios_aplicables": ["Mi Casa Ya", "SFV"],
  "recomendaciones": [{ "proyecto": "Los Nogales", "ranking": 1 }],
  "siguiente_accion": "Enrutar a asesor · agendar visita"
}
```

## Principio
La API expone el **expediente**, no el canal. Cualquier boca (Meta, WhatsApp, web) llega al mismo `POST /leads`.

## Estado
🚧 Scaffold — contrato propuesto.
