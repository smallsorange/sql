with rk_tb as (
select date(log_time) log_day,l.user_id,hobby,dense_rank() over (partition by date(log_time) order by log_time) as rn
from login_tb l left join user_action_tb as u on l.user_id=u.user_id
)
select log_day,user_id,hobby
from rk_tb
where rn=1

-- 最早登录用户
-- 1.利用窗口函数 rank（） over（partition by date（） order by log_time ）找到每天最早登录的用户
-- 2.rn=1
