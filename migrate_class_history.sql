-- 给 students 表增加 class_history 字段，用于记录学员历史班级
ALTER TABLE students ADD COLUMN IF NOT EXISTS class_history JSONB DEFAULT '[]'::jsonb;

-- 确保现有数据的 class_history 为合法 JSON 数组
UPDATE students SET class_history = '[]'::jsonb WHERE class_history IS NULL;

-- 补录：K1001 毕业后学员批量转到 K2002 的历史记录
-- class_id=1 (K1001) -> class_id=11 (K2002)
UPDATE students
SET class_history = '[{"class_id":1,"transferred_at":"2026-07-01T00:00:00Z"}]'::jsonb
WHERE class_id = 11 AND (class_history IS NULL OR class_history = '[]'::jsonb);
