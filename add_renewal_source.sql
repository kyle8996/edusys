-- 为 renewals 表添加来源字段，区分销售系统手动添加 vs 教务系统自动添加
ALTER TABLE renewals
  ADD COLUMN IF NOT EXISTS source TEXT DEFAULT 'sales';

-- 将已有记录的 source 默认标记为 sales（销售系统是最早使用该表的系统）
UPDATE renewals SET source = 'sales' WHERE source IS NULL;

-- 修正：教务系统添加的续费记录特征是 payment_package 形如 '续费 X 课时'，把它们改为 source='edusys'
-- 这样销售系统「在读续费」列表就不会再显示这些教务系统同步来的记录
UPDATE renewals
SET source = 'edusys'
WHERE source = 'sales'
  AND payment_package IS NOT NULL
  AND payment_package LIKE '续费 %';
