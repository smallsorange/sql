select date(order_time) order_date,o.user_id,count(order_id) as order_nums,vip
from order_tb o left join uservip_tb u on o.user_id=u.user_id
group by o.user_id,date(order_time)
having count(order_id)>1

-- where 条件 between 时间 数值
-- having 判断条件，条件可以加入agg函数
-- like name LIKE '张%' name column里面包含张字 模糊匹配

-- 整体执行顺序：
-- 1.from 确定表 join on
-- 2.where 筛选条件
-- 3.group by 进行分组
-- 4.having agg聚合函数条件筛选
-- 5.select 窗口 distinct 
-- 6.order by
-- 7.limit 3只输出三个 offset 3跳过三个
