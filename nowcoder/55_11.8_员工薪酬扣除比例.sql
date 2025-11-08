select st.staff_id,staff_name,concat(round(dock_salary*100/normal_salary,1),'%') as dock_ratio
from staff_tb as st join salary_tb as sa on st.staff_id=sa.staff_id
where department='dep1'
order by dock_ratio desc

-- 1.concat(round(dock_salary*100/normal_salary,1),'%') as dock ratio 百分比
-- 2.dep1
