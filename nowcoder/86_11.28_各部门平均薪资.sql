with t as(
SELECT staff_gender,department,normal_salary-dock_salary as salary 
FROM staff_tb as st INNER JOIN salary_tb as sa ON st.staff_id=sa.staff_id
)
SELECT department,
ROUND(AVG(salary),2) as average_actual_salary,
IFNULL(ROUND(AVG(IF(staff_gender='male',salary,NULL)),2),0.00) as average_actual_salary_male,
IFNULL(ROUND(AVG(IF(staff_gender='female',salary,NULL)),2),0.00) as average_actual_salary_female 
FROM t 
GROUP BY department ORDER BY average_actual_salary DESC

1.join table
2.select salary
3.group by department
4.avg,ifnull if staff_gender='male' salary null

-- ROUND(
--     COALESCE(
--         AVG(CASE WHEN staff_gender = 'male' THEN normal_salary - dock_salary END),
--         0
--     ),
-- 2
-- ) AS average_actual_salary_male
-- 如果没有男性就返回空数值null，则返回0
