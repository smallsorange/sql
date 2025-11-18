-- 1.找到首次注册的日期
--   select user_id,min(date) as reg_date，count() 人数
--   from user_tb
--   group by user_id
-- 2.计算7日有多少人
--   ,d7_login as (
--   select distinct user_id,reg_date
--   from reg_date join user_event on user_id
--   where date_sub(event_date,reg_date) >=7
-- 3.select install_date,count(distinct reg_user_id) as new_users
--   count(d7login) d7 retain_users
--   retain_users / new_users
--   from reg_date left join d7_login on user_id
--   group by reg_date
--   order by reg_date


WITH first_day AS (
    -- 把新增用户的注册日期抽出来
    SELECT
        user_id,
        event_date AS install_date
    FROM user_event
    WHERE is_new = 1
),
d7_login AS (
    -- 找到这些新增用户在第7天登录的记录
    SELECT DISTINCT
        f.user_id,
        f.install_date
    FROM first_day f
    JOIN user_event e
      ON f.user_id = e.user_id
     AND DATEDIFF(e.event_date, f.install_date) = 7
)

SELECT
    f.install_date,
    COUNT(DISTINCT f.user_id) AS new_users,
    COUNT(DISTINCT d.user_id) AS d7_retained_users,
    COUNT(DISTINCT d.user_id) / COUNT(DISTINCT f.user_id) AS d7_retention_rate
FROM first_day f
LEFT JOIN d7_login d
  ON f.user_id = d.user_id
 AND f.install_date = d.install_date
GROUP BY
    f.install_date
ORDER BY
    f.install_date;




-- 查询连续登录 where consecutive_days >= 3
with login_dates as (
    select user_id,date(log_time) as login_date
    from login_tb
    where user_id in (select user_id from register_tb)
),
ranked_tb as (
    select user_id,login_date,row_number() over (partition by user_id order by login_date) rn
    from login_dates
),
grouped_day as (
    select user_id,count(*) as consecutive_day
    from ranked_tb
    group by user_id,date_sub(login_date,interval rn day)
)
select user_id from grouped_day
where consecutive_day >=3
order by user_id
-- 1.确定首次登录天数，min(date) as reg_date
-- 2.date row_number() over (partition by user_id,order by date) rk
-- 3.count(*) as consecutive_day(出现几个就相当于连续几天) group by date_sub(date,interval rk day) 有的差1天，有的差3天分组
-- 4.select where consecutive_day >= 3




  
-- 最长连续登录 max
#1.筛选范围并排序
with order_logins as (
    select user_id,fdate,row_number() over (partition by user_id order by fdate) rn
    from tb_dau
    where year(fdate)='2023' and month(fdate)='1' 
),
#2.找到连续的值
group_login as (
    select user_id,fdate,rn,date_sub(fdate,interval rn day) as grp 
    from order_logins 
),
consecutive as (
    select user_id,grp,count(*) as consec_days
    from group_login
    group by user_id,grp
)
select user_id,max(consec_days) as max_consec_days from consecutive
group by user_id
-- 1.row_number() order by date rn
-- 2.date_sub(fdate,interval rn day) grp 找到相同的连续值
-- 3.consecutive group by user_id,grp count() consec_days
-- 4.select max() consec_days group by id
