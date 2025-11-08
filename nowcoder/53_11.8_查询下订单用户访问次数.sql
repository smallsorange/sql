-- 请查询2022年9月2日这天下订单的用户的访问次数？
-- 要求输出：user_id,访问次数
-- 注：访问次数定义为用户在该日"访问-离开"则记录1次，输出结果按照访问次数降序排序
select 
    user_id,
    count(*) as visit_nums
from visit_tb
where user_id in 
    (
        select user_id 
        from order_tb 
        where date(order_time) ='2022-09-02'
        ) 
and date(visit_time) ='2022-09-02' and date(visit_time)=date(leave_time)
group by user_id
order by visit_nums desc

-- 1.from visit_tb where user_id in date(order_time)='2022-09-02' 9.2下单
-- 2.where date()=09-02 9.2浏览，并且浏览和离开的时间一致
-- 3.group by
-- 4.order by 
