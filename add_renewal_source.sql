-- 为 renewals 表添加来源字段，区分销售系统手动添加 vs 教务系统自动添加
ALTER TABLE renewals
  ADD COLUMN IF NOT EXISTS source TEXT DEFAULT 'sales';

-- 将已有记录的 source 默认标记为 sales（销售系统是最早使用该表的系统）
UPDATE renewals SET source = 'sales' WHERE source IS NULL;
