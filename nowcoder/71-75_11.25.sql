-- 问题：请查询产生理赔金额的快递信息？
-- 要求输出：快递单号、快递种类、理赔费用（按照理赔费用降序排序）
-- 知识点：关联查询、条件查询

select et.exp_number,exp_type,claims_cost
from express_tb as et join exp_cost_tb ec on et.exp_number=ec.exp_number
where claims_cost is not null
order by claims_cost desc

72.
-- 请统计每种快递种类平均运输时长?
-- 要求输出：快递种类、平均运输时长（单位：小时，保留1位小数），根据输出时长从小到大排序
-- 知识点：关联查询、分组查询、聚合函数、时间函数
select exp_type,round(avg(time),1) as time
from (
    select exp_type,timestampdiff(minute,out_time,in_time)/60 as time
    from express_tb as et join exp_action_tb as ea on et.exp_number=ea.exp_number
) t
group by exp_type
order by time
-- 1.join on table select timestampdiff
-- 2.group by exp_type,avg(time)

73.
--   请统计从快递单创建到快递邮出的平均间隔时间?
-- 要求输出：平均间隔了多少分钟，最后结果转化成小时，同时保留3位小数
select round(avg(timestampdiff(minute,create_time,out_time)/60),3) as time
from express_tb as et join exp_action_tb as ea on et.exp_number=ea.exp_number

74.
select product_id,count(product_id) as cnt 
from user_client_log
where step='order'
group by product_id
order by cnt desc
limit 1

75.select uid,count(product_id) as cnt
from user_client_log
where step='order'
group by uid
order by cnt desc
limit 3
