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
    ingreso_smmlv       REAL,
    tiene_vivienda      BOOLEAN,
    situacion_credito   TEXT,             -- buena | regular | mala | desconocida (mock DataCrédito)
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
    siguiente_accion    TEXT,
    actualizado_en      TIMESTAMP DEFAULT CURRENT_TIMESTAMP
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
    motivo          TEXT
);

CREATE INDEX idx_exp_prioridad ON expedientes(prioridad);
CREATE INDEX idx_exp_estado    ON expedientes(estado);
CREATE INDEX idx_eventos_exp   ON eventos(expediente_id);
