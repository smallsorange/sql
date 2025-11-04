-- 45.统计所有参加课程的人数
select sum(c1)+sum(c2)+sum(c3) as staff_nums from (
select 
case when course like '%course1%' then 1 else 0 end as c1,
case when course like '%course2%' then 1 else 0 end as c2,
case when course like '%course3%' then 1 else 0 end as c3
from cultivate_tb) as t1

-- 1.case when course like ‘%course1%’ 如果出现course1字段就写成c1
-- 2.拆分成三列 c1，c2，c3 求和将结果加起来

-- 46.查询培训指定课程的员工信息
select s.staff_id,staff_name
from staff_tb as s left join cultivate_tb c on s.staff_id=c.staff_id
where course like '%course3%'
order by s.staff_id,staff_name
-- 1.left join 连接表
-- 2.where course like '%course3%' 筛选课程3点条件
-- 3.select
