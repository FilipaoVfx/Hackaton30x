# DECISIONS.md

> Por qué tomamos cada decisión de producto. Esto muestra que hubo **pensamiento de producto**, no solo código.

Formato: cada decisión = **contexto → decisión → por qué → alternativa descartada**.

---

## ¿Por qué "expediente" y no "chatbot"?

- **Contexto:** el reto pide perfilar leads. La reacción fácil es "hagamos un bot".
- **Decisión:** el producto central es un **expediente vivo**, no la interfaz de chat.
- **Por qué:** el chat es solo una **boca**. El valor está en la entidad que acumula señales, infiere, calcula subsidios y prioriza. Un bot sin expediente es un formulario con personalidad; un expediente puede alimentarse de chat, web, o contact center indistintamente.
- **Alternativa descartada:** bot conversacional como núcleo → no escala a multicanal, difícil de auditar.

## ¿Por qué inferir antes de preguntar?

- **Contexto:** el reto exige "sin sentirse como un interrogatorio".
- **Decisión:** primero **inferimos** de las señales del canal (campaña, UTM, proyecto); solo **preguntamos los huecos**.
- **Por qué:** cada pregunta que evitamos reduce fricción y abandono. Un lead orgánico no llenó 20 campos; el pago tampoco debería.
- **Alternativa descartada:** formulario completo por adelantado → mata la conversión, contradice el objetivo.

## ¿Por qué IA conversa pero reglas deciden?

- **Contexto:** hay que calcular subsidios y elegibilidad.
- **Decisión:** el LLM **extrae y conversa**; la **elegibilidad de subsidios y el score los calculan reglas deterministas**.
- **Por qué:** un subsidio mal asignado por una alucinación es un problema legal y de confianza. Las reglas son **auditables** por Colsubsidio línea por línea.
- **Alternativa descartada:** pedirle al LLM que decida elegibilidad → no auditable, riesgo de alucinación.

## ¿Por qué un score explicable y no una caja negra?

- **Contexto:** el asesor recibe una prioridad HOT/WARM/COLD.
- **Decisión:** cada score guarda su **desglose** y una **razón en texto claro**.
- **Por qué:** el asesor solo confía (y actúa) si entiende **por qué**. La explicabilidad convierte el número en herramienta.
- **Alternativa descartada:** un score opaco 0-100 → el asesor lo ignora.

## ¿Por qué nutrir en vez de descartar?

- **Contexto:** muchos leads no pueden comprar hoy.
- **Decisión:** los leads COLD entran a **nutrición**, no a la basura.
- **Por qué:** alguien sin capacidad hoy puede comprarla en meses. Es eficiencia comercial **y** propósito social de Colsubsidio.
- **Alternativa descartada:** filtrar y botar → desperdicia CPL ya pagado y traiciona el propósito social.

## ¿Por qué un modelo canónico de lead?

- **Contexto:** los leads llegan por Meta, Google Ads, WhatsApp, web, contact center.
- **Decisión:** todos los canales se traducen a un **Lead Canónico** único.
- **Por qué:** es lo que hace que la solución **escale**. Agregar un canal = agregar un adaptador, sin tocar el cerebro.
- **Alternativa descartada:** lógica por canal → duplicación, no escala, es lo que el reto pide evitar.

## ¿Por qué priorizar la afiliación (90/10) con más peso?

- **Contexto:** regulación exige 90% de ventas a afiliados.
- **Decisión:** el score de afiliación pesa fuerte (0.30), pero el no afiliado **no se descarta** (hay 10% de cupo).
- **Por qué:** el cuello de botella es regulatorio; distinguirlo temprano ahorra el mayor costo.
- **Alternativa descartada:** ignorar afiliación hasta el final → el asesor descubre tarde que el lead no cabe en el cupo.

## ¿Por qué un timeline en el expediente?

- **Contexto:** un expediente evoluciona.
- **Decisión:** guardamos la **historia** del expediente (qué se infirió, qué se preguntó, cómo cambió el score).
- **Por qué:** da trazabilidad al asesor y permite reactivar leads COLD con contexto. También sube el `confidence` al distinguir dato validado de inferido.
- **Alternativa descartada:** solo estado final → se pierde el "por qué" y la posibilidad de nutrir con contexto.

## ¿Por qué datos reales pero integración simulada?

- **Contexto:** la integración en vivo con CRM, DataCrédito y el bot del contact center está **fuera de alcance**.
- **Decisión:** usamos la **base real anonimizada** ([`recursos/`](recursos/), 4.142 compradores) para derivar ICP, priors por canal y la muestra de leads ([`datasets/`](datasets/)); la **conexión en vivo** se simula. Cero data sintética.
- **Por qué:** el reto pide demostrar la **inteligencia de perfilamiento**, no plomería de integración. Con datos reales el valor se ve sin depender de accesos que no tenemos; sin inventar cifras que un jurado podría cuestionar.
- **Alternativa descartada:** ~~leads y proyectos inventados~~ (borrados) y ~~integraciones reales~~ (se va el tiempo del hackathon en autenticación, no en el producto).
