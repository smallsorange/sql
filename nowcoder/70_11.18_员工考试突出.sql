with average_tb as (
select ei.emp_id,e2.exam_id,emp_level,score,timestampdiff(second,start_time,submit_time)/60 as make_time,avg(timestampdiff(second,start_time,submit_time)/60) over (partition by exam_id) as average_time,avg(score) over (partition by exam_id) as average_score,
tag as exam_tag
from emp_info as ei join exam_record er on ei.emp_id=er.emp_id join examination_info e2 on er.exam_id=e2.exam_id
)
select emp_id,emp_level,exam_tag
from average_tb 
where emp_level<7 and score > average_score and make_time<average_time
order by emp_id

# 1.emp level<7 是员工
# 2.每类考试的最高分 rk row_number() partition by exam_tag order by score rk
# 3.time<avg score>avg
