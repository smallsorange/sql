select vip,count(visit_time) as visit_nums,count(distinct v.user_id) as visit_users
from visit_tb v join uservip_tb as u on v.user_id=u.user_id
group by vip
order by visit_nums desc
