-- ════════════════════════════════════════════════════════════
-- 请假课时表 (leaves)
-- 记录每个学员每个月的请假课时数（手动填写，从每年 3 月开始）
-- 与 attendance 表（实际上课课时）平行
-- ════════════════════════════════════════════════════════════

CREATE TABLE IF NOT EXISTS leaves (
  id        BIGSERIAL PRIMARY KEY,
  student_id INTEGER NOT NULL,
  year       INTEGER NOT NULL,
  month      INTEGER NOT NULL,
  hours      NUMERIC NOT NULL DEFAULT 0,
  UNIQUE (student_id, year, month)
);

-- 索引（提升按学员/月份查询性能）
CREATE INDEX IF NOT EXISTS idx_leaves_student    ON leaves(student_id);
CREATE INDEX IF NOT EXISTS idx_leaves_year_month ON leaves(year, month);

-- 说明：
-- 1. 请在 Supabase Dashboard 的 SQL Editor 中执行本脚本
-- 2. 前端 loadAll() 已对 leaves 表做容错：表未创建时不影响其它功能
-- 3. 保存时 upsert 唯一键为 (student_id, year, month)
