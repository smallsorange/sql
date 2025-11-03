select user_id,g.room_id,room_type,datediff(checkout_time,checkin_time) as days
from guestroom_tb as g left join checkin_tb c on g.room_id=c.room_id
where datediff(checkout_time,checkin_time)>1
order by days,room_id,user_id desc

-- 1.from g c left join
-- 2.where datediff>=2 date(checkin)=
-- 3.select 

-- select user_id,g.room_id,room_type,datediff(checkout_time,checkin_time) as days
-- from guestroom_tb as g left join checkin_tb c on g.room_id=c.room_id
-- where date(checkin_time)='2022-06-12' and datediff(checkout_time,checkin_time)>=2
-- order by days,room_id,user_id desc
