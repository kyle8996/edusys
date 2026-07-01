-- ============================================
-- DK邻里教务系统 - 班级表扩展月份字段迁移
-- 用途：为 classes 表添加 m7-m12 字段，支持班级排课进度显示到7-12月
-- 执行方式：在 Supabase Dashboard → SQL Editor 中执行
-- ============================================

ALTER TABLE classes
  ADD COLUMN IF NOT EXISTS m7 NUMERIC DEFAULT 0,
  ADD COLUMN IF NOT EXISTS m8 NUMERIC DEFAULT 0,
  ADD COLUMN IF NOT EXISTS m9 NUMERIC DEFAULT 0,
  ADD COLUMN IF NOT EXISTS m10 NUMERIC DEFAULT 0,
  ADD COLUMN IF NOT EXISTS m11 NUMERIC DEFAULT 0,
  ADD COLUMN IF NOT EXISTS m12 NUMERIC DEFAULT 0;

-- ✅ 迁移完成！刷新教务系统页面后，班级排课进度会自动显示到当前月份（含7月）。
