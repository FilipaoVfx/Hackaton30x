-- Expediente Inteligente — esquema propuesto (mock del CRM)
-- Motor: agnóstico (SQLite / Postgres). Ajustar tipos según implementación.

-- Lead canónico crudo, tal como llega del adaptador de canal
CREATE TABLE leads (
    id              TEXT PRIMARY KEY,
    fuente          TEXT NOT NULL,        -- meta_ads | google_ads | whatsapp | web | contact_center
    campana         TEXT,
    utm_term        TEXT,
    nombre          TEXT,
    telefono        TEXT,
    email           TEXT,
    proyecto_interes TEXT,
    creado_en       TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Estado vivo del expediente
CREATE TABLE expedientes (
    id                  TEXT PRIMARY KEY,
    lead_id             TEXT NOT NULL REFERENCES leads(id),
    -- perfil (validado o inferido)
    afiliado            BOOLEAN,          -- NULL = desconocido
    segmento            TEXT,             -- Básico | Medio | Alto | Joven (segmentación caja)
    ingreso_smmlv       REAL,
    grupo_familiar      INTEGER,
    tiene_vivienda      BOOLEAN,
    situacion_credito   TEXT,             -- buena | regular | mala | desconocida (mock DataCrédito)
    -- narrativa (Narrative Engine, canal WhatsApp)
    narrativa_dominante TEXT,             -- ej. primera_vivienda | familia | pet_lover
    -- resultado del scoring
    score_global        REAL,
    confidence          REAL,
    prioridad           TEXT,             -- HOT | WARM | COLD
    razon               TEXT,             -- explicación en texto claro
    -- desglose (auditable)
    score_afiliacion    REAL,
    score_financiero    REAL,
    score_subsidio      REAL,
    score_intencion     REAL,
    score_documentos    REAL,
    -- estado y acción
    estado              TEXT DEFAULT 'NUEVO', -- NUEVO | EN_PERFILAMIENTO | HOT | WARM | COLD | CERRADO
    next_best_action    TEXT,             -- asesor | nutrir | documentos | agendar | esperar
    actualizado_en      TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Narrativas (motivaciones) por expediente — Narrative Engine (WhatsApp)
CREATE TABLE narrativas_expediente (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    expediente_id   TEXT NOT NULL REFERENCES expedientes(id),
    narrativa       TEXT NOT NULL,        -- id de datasets/narrativas.json
    peso            REAL,                 -- [0,1]
    confianza       REAL,                 -- [0,1]
    actualizado_en  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Feature Store: señales de comportamiento (clics, vistas) — canal WhatsApp
CREATE TABLE senales (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    expediente_id   TEXT NOT NULL REFERENCES expedientes(id),
    senal           TEXT NOT NULL,        -- ej. click_pet | view_pool | download_brochure
    valor           TEXT,
    creado_en       TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Objeciones detectadas (alimenta al Advisor Copilot)
CREATE TABLE objeciones (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    expediente_id   TEXT NOT NULL REFERENCES expedientes(id),
    objecion        TEXT NOT NULL,        -- ej. cuota_inicial | ubicacion | precio
    detalle         TEXT
);

-- Subsidios aplicables calculados por el motor determinista
CREATE TABLE subsidios_aplicables (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    expediente_id   TEXT NOT NULL REFERENCES expedientes(id),
    subsidio        TEXT NOT NULL,        -- VIS | VIP | Mi Casa Ya | SFV
    impacto_cuota_inicial REAL,           -- aporte estimado
    detalle         TEXT
);

-- Timeline auditable: qué se infirió, qué se preguntó, cómo cambió el score
CREATE TABLE eventos (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    expediente_id   TEXT NOT NULL REFERENCES expedientes(id),
    tipo            TEXT NOT NULL,        -- inferencia | pregunta | respuesta | score | ruteo | nutricion
    campo           TEXT,                 -- campo afectado (ej. ingreso_smmlv)
    valor           TEXT,
    origen          TEXT,                 -- inferido | validado
    creado_en       TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Recomendaciones de proyecto por expediente
CREATE TABLE recomendaciones (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    expediente_id   TEXT NOT NULL REFERENCES expedientes(id),
    proyecto_id     TEXT NOT NULL,
    ranking         INTEGER,              -- 1 = mejor match
    afinidad        REAL,                 -- Home Match: compatibilidad por afinidad, no por precio
    motivo          TEXT
);

CREATE INDEX idx_exp_prioridad  ON expedientes(prioridad);
CREATE INDEX idx_exp_estado     ON expedientes(estado);
CREATE INDEX idx_eventos_exp    ON eventos(expediente_id);
CREATE INDEX idx_narrativas_exp ON narrativas_expediente(expediente_id);
CREATE INDEX idx_senales_exp    ON senales(expediente_id);
