select department,avg(normal_salary-dock_salary) as avg_salary
from staff_tb st left join salary_tb sa on st.staff_id=sa.staff_id
where normal_salary-dock_salary<=30000 and normal_salary-dock_salary>=4000
group by department
order by avg_salary desc



-- pipeline
-- FROM → ON → JOIN → WHERE → GROUP BY → HAVING → SELECT → DISTINCT → ORDER BY → LIMIT
-- 聚合函数 vs 窗口函数
-- | 对比项           | 聚合函数                                               | 窗口函数                                                             |
-- | ------------- | -------------------------------------------------- | ---------------------------------------------------------------- |
-- | 是否汇总成一行       | ✅ 是                                           | ❌ 否，每行保留                                                         |
-- | 是否使用 `OVER()` | ❌ 否                                             | ✅ 必须使用                                                           |
-- | 执行阶段          | GROUP BY 后                                       | SELECT 阶段                                                        |
-- | 示例            | `SELECT dept, AVG(salary) FROM emp GROUP BY dept;` | `SELECT emp_name, AVG(salary) OVER(PARTITION BY dept) FROM emp;` |
-- | 结果形态          | ✅✅✅每组一行                                    |✅✅✅ 每行一行（带分组统计）                                                      |
