select date_format(t.t_time,'%Y-%m') as time,sum(t_amount) as total
from trade t left join customer as c on t_cus=c_id
where t_type=1 and t_cus='101' and year(t.t_time)='2023'
group by time
order by time

#1.from trade 连接表
#2.date_formate(t.t_time,'%Y-%m') 格式
#3.group by
