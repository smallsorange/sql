#sql
#从听歌流水中找到18-25岁用户在2022年每个月播放次数top 3的周杰伦的歌曲
select distinct month,ranking,song_name,play_pv from (
select 
    month(fdate) as month,song_name,count(song_name) as play_pv,
    row_number() over (partition by month(fdate) order by count(song_name) desc ,s.song_id asc) as ranking
from play_log as p 
    left join user_info as u on p.user_id=u.user_id
    left join song_info as s on p.song_id=s.song_id
where u.age between 18 and 25 and year(fdate)='2022' 
and singer_name='周杰伦'
group by month(fdate),song_name,p.song_id
) as t
where ranking <=3
order by month asc,play_pv desc 

#1.from 三个表里面找数据 连接表
#2.18-25 2022 周杰伦作为条件
#3.按照月分组group by month(fdate),song_name
#4.count(song_name) as play_pv  row_number()1、2、3 dense_rank()1、1、2 rank()1、1、3 order by play_pv
#5.ranking<=3 外层查询
