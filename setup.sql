-- ============================================
-- DK邻里教务系统 - Supabase 数据库初始化
-- 请在 Supabase Dashboard → SQL Editor 中执行
-- ============================================

-- 1. 班级表
CREATE TABLE IF NOT EXISTS classes (
  id BIGINT PRIMARY KEY,
  name TEXT NOT NULL,
  phase TEXT DEFAULT '',
  freq NUMERIC DEFAULT 0,
  total_hours NUMERIC DEFAULT 0,
  before_hours NUMERIC DEFAULT 0,
  m3 NUMERIC DEFAULT 0,
  m4 NUMERIC DEFAULT 0,
  m5 NUMERIC DEFAULT 0,
  m6 NUMERIC DEFAULT 0,
  m7 NUMERIC DEFAULT 0,
  m8 NUMERIC DEFAULT 0,
  m9 NUMERIC DEFAULT 0,
  m10 NUMERIC DEFAULT 0,
  m11 NUMERIC DEFAULT 0,
  m12 NUMERIC DEFAULT 0
);

-- 2. 学员表
CREATE TABLE IF NOT EXISTS students (
  id BIGINT PRIMARY KEY,
  name TEXT NOT NULL,
  class_id BIGINT REFERENCES classes(id),
  paid_hours NUMERIC DEFAULT 0,
  remaining_hours NUMERIC DEFAULT 0,
  status TEXT DEFAULT '在读',
  sort_order INTEGER DEFAULT 0
);

-- 3. 课时记录表
CREATE TABLE IF NOT EXISTS attendance (
  id BIGSERIAL PRIMARY KEY,
  student_id BIGINT REFERENCES students(id),
  year INTEGER NOT NULL,
  month INTEGER NOT NULL,
  hours NUMERIC DEFAULT 0,
  UNIQUE(student_id, year, month)
);

-- 4. 开启 RLS 并设置公开访问策略
ALTER TABLE classes ENABLE ROW LEVEL SECURITY;
ALTER TABLE students ENABLE ROW LEVEL SECURITY;
ALTER TABLE attendance ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "allow_all_classes" ON classes;
CREATE POLICY "allow_all_classes" ON classes FOR ALL USING (true) WITH CHECK (true);
DROP POLICY IF EXISTS "allow_all_students" ON students;
CREATE POLICY "allow_all_students" ON students FOR ALL USING (true) WITH CHECK (true);
DROP POLICY IF EXISTS "allow_all_attendance" ON attendance;
CREATE POLICY "allow_all_attendance" ON attendance FOR ALL USING (true) WITH CHECK (true);

-- 5. 插入班级数据
INSERT INTO classes (id,name,phase,freq,total_hours,before_hours,m3,m4,m5,m6) VALUES (1,'K1001(三六)','K1',10,42,46,0,0,0,0) ON CONFLICT (id) DO NOTHING;
INSERT INTO classes (id,name,phase,freq,total_hours,before_hours,m3,m4,m5,m6) VALUES (2,'K1002(四六)','K1',10,68,20,0,0,0,0) ON CONFLICT (id) DO NOTHING;
INSERT INTO classes (id,name,phase,freq,total_hours,before_hours,m3,m4,m5,m6) VALUES (3,'K1003(日)','K1',6,88,0,0,0,0,0) ON CONFLICT (id) DO NOTHING;
INSERT INTO classes (id,name,phase,freq,total_hours,before_hours,m3,m4,m5,m6) VALUES (4,'K2001(四六)','K2',12,102,0,0,0,0,0) ON CONFLICT (id) DO NOTHING;
INSERT INTO classes (id,name,phase,freq,total_hours,before_hours,m3,m4,m5,m6) VALUES (5,'S1001(三日)','S',10,84,0,0,0,0,0) ON CONFLICT (id) DO NOTHING;
INSERT INTO classes (id,name,phase,freq,total_hours,before_hours,m3,m4,m5,m6) VALUES (6,'S3001(四六)','S',10,84,0,0,0,0,0) ON CONFLICT (id) DO NOTHING;
INSERT INTO classes (id,name,phase,freq,total_hours,before_hours,m3,m4,m5,m6) VALUES (7,'K1004(未开班)','K1',10,88,0,0,0,0,0) ON CONFLICT (id) DO NOTHING;

-- 6. 插入学员数据
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (1,'黄梓铭',1,47,12.5,'在读',0) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (2,'陈攸诺',1,46,14.5,'在读',1) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (3,'苏灏渝',1,61,29,'在读',2) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (4,'林歆然',1,44,13,'在读',3) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (5,'周裕皓',1,88,68.5,'在读',4) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (6,'周清芷',1,88,72,'在读',5) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (7,'温嘉伦',1,88,84.5,'在读',6) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (8,'邬旻灏',1,88,86.5,'在读',7) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (9,'王凯妮',2,44,21,'在读',0) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (10,'李逸少',2,47,15.5,'在读',0) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (11,'刘睿怡',2,30,7.5,'在读',0) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (12,'刘菲尔',2,95,65,'在读',0) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (13,'张文钰',2,95,68,'在读',0) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (14,'邬卓衡',2,88,63.5,'在读',0) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (15,'卢思广',2,44,26.5,'在读',0) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (16,'邹瑾',2,88,88,'在读',0) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (17,'张丞逸',3,48,42,'在读',7) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (18,'岑婉瑜',3,27,9,'在读',0) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (19,'黄雅莉',3,44,26,'在读',1) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (20,'安歌',3,88,71.5,'在读',2) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (21,'张璟乐',3,88,73,'在读',3) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (22,'陈艺昕',3,44,33.5,'在读',4) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (23,'邱语汐',3,44,30.5,'在读',5) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (24,'李先泽',3,60,55.5,'在读',6) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (25,'梁澄澈',4,15,0,'毕业',0) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (26,'高雪晴',4,51,19.5,'在读',0) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (27,'严宝霆',4,102,64.5,'在读',0) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (28,'王骏铭',4,51,15,'在读',0) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (29,'善知Daniel',4,51,15,'在读',0) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (30,'陈楷淇',4,102,66,'在读',0) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (31,'张晓淇',4,102,67.5,'在读',0) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (32,'张沐晨',4,102,64.5,'在读',0) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (33,'胡昕悦',4,102,96,'在读',0) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (34,'王凯琪',5,49,17,'在读',0) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (35,'刘子凡',5,66,44,'在读',0) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (36,'何依玲',5,49,12.5,'在读',0) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (37,'邝弘熙',5,55,19.5,'在读',0) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (38,'林子苏',5,55,18.5,'在读',0) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (39,'周诗静',5,42,16,'在读',0) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (40,'何雨琪',5,84,61.5,'在读',0) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (41,'雷承安',5,84,64.5,'在读',0) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (42,'江诺伊',6,49,14.5,'在读',0) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (43,'王伊涵',6,51,16.5,'在读',0) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (44,'陈鹏宇',6,50,15.5,'在读',0) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (45,'林昱彤',6,51,16.5,'在读',0) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (46,'李佩潼',6,42,10,'在读',0) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (47,'唐甜君',6,84,69,'在读',0) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (48,'朱子钧',7,44,44,'在读',0) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (49,'朱糖糖',7,88,88,'在读',0) ON CONFLICT (id) DO NOTHING;
INSERT INTO students (id,name,class_id,paid_hours,remaining_hours,status,sort_order) VALUES (50,'朱彦沂',7,88,88,'在读',0) ON CONFLICT (id) DO NOTHING;

-- 7. 插入课时记录（共206条）
INSERT INTO attendance (student_id,year,month,hours) VALUES (1,2026,3,9) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (1,2026,4,9.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (1,2026,5,11) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (1,2026,6,5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (2,2026,3,9) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (2,2026,4,9.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (2,2026,5,9.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (2,2026,6,3.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (3,2026,3,9) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (3,2026,4,9.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (3,2026,5,10) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (3,2026,6,3.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (4,2026,3,6.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (4,2026,4,9.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (4,2026,5,10) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (4,2026,6,5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (5,2026,3,0) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (5,2026,4,5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (5,2026,5,9.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (5,2026,6,5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (6,2026,3,0) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (6,2026,4,1.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (6,2026,5,9.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (6,2026,6,5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (7,2026,3,0) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (7,2026,4,0) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (7,2026,5,0) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (7,2026,6,3.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (8,2026,3,0) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (8,2026,4,0) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (8,2026,5,0) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (8,2026,6,1.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (9,2026,3,4) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (9,2026,4,7) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (9,2026,5,8.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (9,2026,6,3.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (10,2026,3,5.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (10,2026,4,9.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (10,2026,5,11.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (10,2026,6,5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (11,2026,3,4) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (11,2026,4,6.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (11,2026,5,10) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (11,2026,6,2) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (12,2026,3,4) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (12,2026,4,9.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (12,2026,5,11.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (12,2026,6,5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (13,2026,3,4) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (13,2026,4,9.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (13,2026,5,8.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (13,2026,6,5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (14,2026,3,0) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (14,2026,4,9.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (14,2026,5,10) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (14,2026,6,5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (15,2026,3,0) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (15,2026,4,2.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (15,2026,5,11.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (15,2026,6,3.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (16,2026,3,0) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (16,2026,4,0) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (16,2026,5,0) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (16,2026,6,0) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (17,2026,3,1.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (17,2026,4,0) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (17,2026,5,1.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (17,2026,6,3) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (18,2026,3,3) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (18,2026,4,4.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (18,2026,5,7.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (18,2026,6,3) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (19,2026,3,3) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (19,2026,4,4.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (19,2026,5,7.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (19,2026,6,3) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (20,2026,3,3) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (20,2026,4,4.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (20,2026,5,7.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (20,2026,6,1.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (21,2026,3,0) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (21,2026,4,4.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (21,2026,5,7.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (21,2026,6,3) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (22,2026,3,0) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (22,2026,4,3) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (22,2026,5,4.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (22,2026,6,3) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (23,2026,3,0) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (23,2026,4,3) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (23,2026,5,7.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (23,2026,6,3) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (24,2026,3,0) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (24,2026,4,0) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (24,2026,5,1.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (24,2026,6,3) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (25,2026,3,4.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (25,2026,4,10.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (25,2026,5,0) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (25,2026,6,0) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (26,2026,3,6) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (26,2026,4,9) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (26,2026,5,10.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (26,2026,6,6) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (27,2026,3,6) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (27,2026,4,12) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (27,2026,5,13.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (27,2026,6,6) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (28,2026,3,6) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (28,2026,4,10.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (28,2026,5,13.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (28,2026,6,6) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (29,2026,3,4.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (29,2026,4,12) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (29,2026,5,13.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (29,2026,6,6) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (30,2026,3,6) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (30,2026,4,10.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (30,2026,5,13.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (30,2026,6,6) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (31,2026,3,4.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (31,2026,4,12) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (31,2026,5,12) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (31,2026,6,6) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (32,2026,3,6) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (32,2026,4,12) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (32,2026,5,13.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (32,2026,6,6) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (33,2026,3,0) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (33,2026,4,0) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (33,2026,5,0) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (33,2026,6,6) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (34,2026,3,10.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (34,2026,4,9.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (34,2026,5,7) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (34,2026,6,5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (35,2026,3,0) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (35,2026,4,8.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (35,2026,5,8.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (35,2026,6,5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (36,2026,3,10.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (36,2026,4,9.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (36,2026,5,11.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (36,2026,6,5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (37,2026,3,10.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (37,2026,4,8.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (37,2026,5,11.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (37,2026,6,5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (38,2026,3,10.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (38,2026,4,9.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (38,2026,5,11.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (38,2026,6,5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (39,2026,3,2.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (39,2026,4,9.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (39,2026,5,9) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (39,2026,6,5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (40,2026,3,0) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (40,2026,4,6) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (40,2026,5,11.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (40,2026,6,5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (41,2026,3,0) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (41,2026,4,6) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (41,2026,5,8.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (41,2026,6,5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (42,2026,3,10) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (42,2026,4,9.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (42,2026,5,10) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (42,2026,6,5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (43,2026,3,10) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (43,2026,4,9.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (43,2026,5,10) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (43,2026,6,5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (44,2026,3,10) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (44,2026,4,9.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (44,2026,5,10) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (44,2026,6,5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (45,2026,3,10) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (45,2026,4,9.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (45,2026,5,10) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (45,2026,6,5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (46,2026,3,7.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (46,2026,4,9.5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (46,2026,5,10) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (46,2026,6,5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (47,2026,3,0) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (47,2026,4,0) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (47,2026,5,10) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (47,2026,6,5) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (48,2026,3,0) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (48,2026,4,0) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (48,2026,5,0) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (48,2026,6,0) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (49,2026,3,0) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (49,2026,4,0) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (49,2026,5,0) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (49,2026,6,0) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (1,2026,7,0) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (2,2026,7,0) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (3,2026,7,0) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (4,2026,7,0) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (5,2026,7,0) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (6,2026,7,0) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (7,2026,7,0) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (8,2026,7,0) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (50,2026,6,0) ON CONFLICT (student_id,year,month) DO NOTHING;
INSERT INTO attendance (student_id,year,month,hours) VALUES (50,2026,5,0) ON CONFLICT (student_id,year,month) DO NOTHING;

-- 8. 创建索引
CREATE INDEX IF NOT EXISTS idx_students_class ON students(class_id);
CREATE INDEX IF NOT EXISTS idx_attendance_student ON attendance(student_id);
CREATE INDEX IF NOT EXISTS idx_attendance_ym ON attendance(year, month);

-- ✅ 数据库初始化完成！刷新页面即可使用。