with shifa_tb as (
    select staff_name,staff_gender,department,normal_salary-dock_salary salary
from staff_tb st join salary_tb sa on st.staff_id=sa.staff_id
)
select department,round(avg(salary),2) as average_actual_salary,
IFNULL(round(avg(if(staff_gender='male',salary,null)),2),0) as average_actual_salary_male
,
IFNULL(round(avg(if(staff_gender='female',salary,null)),2),0) as average_actual_salary_female
from shifa_tb
group by department
order by average_actual_salary desc

# ifnull(round(avg(if(staff_gender='male',salary,null)),2),0)
# if round(avg(if(staff_gender='male',salary,null)),2) is null 
# print 0
# if(staff_gender='male',salary,null))
# if gender=male salary else null

-- ROUND(
--     COALESCE(
--         AVG(CASE WHEN staff_gender = 'male' THEN normal_salary - dock_salary END),
--         0
--     ),
-- 2
-- ) AS average_actual_salary_male
-- 如果没有男性就返回空数值null，则返回0
