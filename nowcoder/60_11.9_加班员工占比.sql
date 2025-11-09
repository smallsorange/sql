select department,concat(round(sum(if(round(timestampdiff(minute,first_clockin,last_clockin)/60,1)>9.5,1,0))*100/count(st.staff_id),1),'%') as ratio
from staff_tb st left join attendent_tb at on st.staff_id=at.staff_id
group by department
order by ratio desc

-- concat(
--   round(
--     sum(
--       if(
--         round(
--           timestampdiff(
--             minute,first_clockin,last_clockin
--             )/60,1
--               )>9.5,1,0
--                 )
--                   )*100/count(st.staff_id),1),'%') as ratio
-- concat连接%
-- round求取一位数
-- sum求和计算有多少个加班的
-- if 判断哪些是加班的
-- round去近似
-- timestampdiff（）/60 计算小时
