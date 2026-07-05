-- 给 classes 表添加 status 字段（班级毕业/在读状态）
-- 在 Supabase SQL Editor 中执行

ALTER TABLE classes
  ADD COLUMN IF NOT EXISTS status TEXT DEFAULT '在读';

-- 初始化现有班级为"在读"
UPDATE classes SET status = '在读' WHERE status IS NULL;
