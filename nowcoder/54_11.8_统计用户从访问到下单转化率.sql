-- 请统计该商城每天用户从访问到下订单的转化率。
-- 要求输出：日期，转化率（该日下订单人数/访问人数，以百分数形式输出并四舍五入保留1位小数）
with visit_num_tb as 
(
select date(visit_time) as date,count(distinct user_id) as visit_nums
from visit_tb 
group by date(visit_time)
order by date(visit_time)
),
order_num_tb as (
    select date(order_time) as date,count(distinct user_id) as order_nums
    from order_tb
    group by date(order_time)
    order by date(order_time)
)
select vnt.date,concat(round(order_nums*100/visit_nums,1),'%') cr
from visit_num_tb as vnt left join order_num_tb as ont on vnt.date=ont.date
order by vnt.date

-- 1.visit_num_tb select count as visit_nums
-- 2.order_num_tb select count as order_nums
-- 3.join vnt,ont on date
-- 4.cr=concat(round(order_nums*100/visit_nums,1),'%') 
