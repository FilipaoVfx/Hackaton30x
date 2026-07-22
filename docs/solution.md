# Solución

> Este documento explica la **filosofía** de la solución. No los componentes, no los microservicios: la **visión**.

## La idea central

No calificamos personas. **Construimos un expediente.**

Un lead es un dato suelto: un nombre, un teléfono, un formulario. Un **expediente** es una entidad viva que crece: acumula señales, infiere lo que puede, pregunta lo que falta, y en todo momento sabe **qué tan cerca está de una venta** y **cuál es la siguiente acción**.

> El lead orgánico convierte porque llega **auto-seleccionado**. Nuestra solución replica esa auto-selección con software: convierte un lead pago en un expediente tan calificado como el de un lead orgánico.

## Reencuadre: de "calificar" a "acompañar"

| Enfoque tradicional | Expediente Inteligente |
|---|---|
| Filtrar y descartar | Perfilar y **acompañar** |
| El lead es bueno o malo | El lead está **listo, casi listo, o aún no** |
| Interrogatorio de requisitos | Conversación que **pregunta solo lo que falta** |
| Todo va al asesor | Solo lo **HOT** va al asesor; lo demás se nutre |
| Caja negra | **Score explicable** con su razón |

## Los cuatro principios

### 1. Un solo cerebro, muchas bocas
La inteligencia **no depende del canal**. Meta, WhatsApp, web o contact center son solo **bocas** que alimentan el mismo cerebro. Cada canal es un adaptador hacia un **modelo canónico de lead**. Así la lógica escala: agregar un canal es agregar un adaptador, no reescribir el sistema.

### 2. Inferir antes de preguntar
Cada lead ya trae señales: el canal por el que entró, la campaña (UTM), el proyecto que miraba, datos del formulario. **Primero inferimos** todo lo posible. **Solo preguntamos los huecos.** El resultado no se siente como interrogatorio, porque no lo es: son 3-4 preguntas, no 20.

### 3. Nadie se descarta
Un lead que no puede comprar **hoy** puede comprar en unos meses. En vez de botarlo, lo marcamos **COLD** y entra a un flujo de **nutrición**. Esto no es solo eficiencia comercial: es el **propósito social** de Colsubsidio hecho producto.

### 4. Explicable o no sirve
El asesor solo confía en el score si sabe **por qué**. Cada prioridad viene con su razón: _"HOT: afiliado, ingreso 3 SMMLV, aplica a Mi Casa Ya, cuota inicial cubierta por subsidio"_. Sin caja negra.

## Qué construye el sistema, paso a paso

```
1. Recibe un lead de cualquier canal.
2. Lo normaliza a un Expediente (modelo canónico).
3. Infiere: ¿afiliado? ¿rango de ingreso? ¿qué campaña?
4. Pregunta solo lo que falta (conversacional, sin interrogatorio).
5. Calcula subsidios aplicables.
6. Calcula un score explicable → HOT / WARM / COLD.
7. Rutea:
     HOT  → asesor (cierre + agenda de visita)
     WARM → recomendación de proyecto + micro-nutrición
     COLD → flujo de nutrición (vuelve más adelante)
8. Recomienda 1-3 proyectos acordes al perfil.
9. Todo sin intervención humana.
```

## La meta, medible

> **Que los leads pagos alcancen la tasa de conversión de los orgánicos.**

No reinventamos el embudo. Cerramos la brecha de calificación entre lo pago y lo orgánico. El éxito se mide como: _conversión de lead pago acercándose a la de lead orgánico_, y _reducción del tiempo del asesor por lead cerrado_.

📄 Cómo se calcula todo esto → [`scoring-engine.md`](scoring-engine.md)
📄 Por qué elegimos este enfoque → [`../DECISIONS.md`](../DECISIONS.md)
