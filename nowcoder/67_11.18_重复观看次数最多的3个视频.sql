with cnt_tb as (
    select release_date,uid,c.cid,count(uid) as pv
    from course_info_tb as c join play_record_tb as p on c.cid=p.cid
    group by c.cid,uid,release_date
),
rk_tb as (select cid,round(pv*1.0,3) pv,row_number() over (order by pv desc,release_date desc) as rk
from cnt_tb
where pv>1
)
select cid,pv,rk from rk_tb
where rk<=3
# 1.连接表，根据pv规则计算观看次数
# 2.row_number() 排序
# 3.group by where rk<3 orderby rk
