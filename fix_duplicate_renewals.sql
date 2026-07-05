-- 删除陈攸诺 2026-07-04 的重复续费记录（保留一条）
-- 注意：执行前请先确认 SELECT 结果确实是重复记录

-- 1. 先查看重复记录
SELECT * FROM renewals
WHERE student_name = '陈攸诺'
  AND payment_date = '2026-07-04'
  AND course_hours = 51
  AND total_payment = 6375;

-- 2. 删除重复记录（保留 id 最小的一条）
DELETE FROM renewals
WHERE id IN (
  SELECT id FROM (
    SELECT id, ROW_NUMBER() OVER (
      PARTITION BY student_name, payment_date, course_hours, total_payment
      ORDER BY id ASC
    ) as rn
    FROM renewals
    WHERE student_name = '陈攸诺'
      AND payment_date = '2026-07-04'
      AND course_hours = 51
      AND total_payment = 6375
  ) t
  WHERE rn > 1
);

-- 3. 同步扣减陈攸诺的 paid_hours（因为重复记录导致缴费课时被加了两次）
UPDATE students
SET paid_hours = paid_hours - 51
WHERE name = '陈攸诺';

-- 4. 验证
SELECT id, name, paid_hours FROM students WHERE name = '陈攸诺';
