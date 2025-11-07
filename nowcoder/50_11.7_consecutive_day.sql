with login_dates as (
    select distinct user_id,date(log_time) as login_date
    from login_tb
    where user_id in (select user_id from register_tb)
),
numbered_logins as (
    select user_id,login_date,row_number() over (partition by user_id order by login_date) as rn 
    from login_dates
),
grouped_logins as (
    select user_id,count(*) as consecutive_days
    from numbered_logins
    group by user_id,date_sub(login_date,interval rn day)
)
select user_id
from grouped_logins
where consecutive_days >=3
order by user_id

-- 1.去重，select distinct from login_tb 
-- 2.where in 判断是在2-08注册的
-- 3.numbered row_number() 按照日期排序
-- 4.grouped group by date_sub login_date,interval rn day 按照 计算登录login_date,和rn 差值的天数 就会差1 2 3
-- count(login_date-rn)  出现的次数 大于3 说明连续登录了三天
-- 核心：row_number () over partition by user order by login_date
-- date_sub(login_date,interval rn day)
