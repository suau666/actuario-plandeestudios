-- ─────────────────────────────────────────────────────────────────────────────
-- ACTUARIO · Plan de Estudios — Supabase SQL
-- Ejecutar en: Supabase Dashboard → SQL Editor → New query → Run
-- ─────────────────────────────────────────────────────────────────────────────

-- 1. Tabla principal de progreso
CREATE TABLE IF NOT EXISTS user_progress (
  id          uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id     text NOT NULL DEFAULT 'default',
  states      jsonb NOT NULL DEFAULT '{}',    -- { "602": "approved", "601": "regular", ... }
  opt_names   jsonb NOT NULL DEFAULT '{}',    -- { "opt1": "Nombre materia", "opt2": "..." }
  theme       text NOT NULL DEFAULT 'dark',   -- 'dark' | 'white' | 'aqua' | 'cream' | 'slate'
  updated_at  timestamptz DEFAULT now()
);

-- 2. Índice por user_id para búsquedas rápidas
CREATE INDEX IF NOT EXISTS idx_user_progress_user_id ON user_progress(user_id);

-- 3. Habilitar Row Level Security (RLS)
ALTER TABLE user_progress ENABLE ROW LEVEL SECURITY;

-- 4. Política: acceso público para lectura y escritura (app sin auth)
--    Si en el futuro agregás autenticación, reemplazá por policies con auth.uid()
CREATE POLICY "allow_all_for_default_user"
  ON user_progress
  FOR ALL
  USING (true)
  WITH CHECK (true);

-- ─────────────────────────────────────────────────────────────────────────────
-- OPCIONAL: Si querés usar autenticación de Supabase Auth en el futuro,
-- reemplazá las policies de arriba por estas:
-- ─────────────────────────────────────────────────────────────────────────────
-- DROP POLICY IF EXISTS "allow_all_for_default_user" ON user_progress;
--
-- CREATE POLICY "users_own_progress"
--   ON user_progress
--   FOR ALL
--   USING (auth.uid()::text = user_id)
--   WITH CHECK (auth.uid()::text = user_id);
-- ─────────────────────────────────────────────────────────────────────────────

-- 5. Verificar que quedó bien
SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'user_progress'
ORDER BY ordinal_position;
