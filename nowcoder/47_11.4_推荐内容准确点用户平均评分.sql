select round(avg(score),3) as avg_score
from user_action_tb u
where u.user_id in(
    select distinct r.rec_user
    from recommend_tb r left join user_action_tb u on r.rec_user=u.user_id
    where r.rec_info_l=u.hobby_l
)
  


1.from recommend_tb
2.where in (select distinct ) 去重复
