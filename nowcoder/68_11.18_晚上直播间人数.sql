select u.room_id,r.room_name,count(distinct user_id) as user_count
from user_view_tb as u join room_info_tb as r on u.room_id=r.room_id
where in_time <= '24:00:00' and out_time >= '23:00:00'
group by u.room_id,r.room_name

# 1.连接表
# 2.where条件，进入的时间小于12点，出去的时间大于11点
# 3.group by 房间id
# 4.select count distinct 去重复
