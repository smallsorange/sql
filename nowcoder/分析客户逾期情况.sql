select pay_ability,concat(round(count(overdue_days)*100/count(*),1),'%') as overdue_ratio
from loan_tb l left join customer_tb as c on l.customer_id=c.customer_id
group by pay_ability
order by overdue_ratio desc

-- 1.concat(value,‘%’)
-- 2.CONCAT(ROUND(SUM(CASE WHEN lt.overdue_days IS NOT NULL THEN 1 ELSE 0 END)/COUNT(*)*100,1),'%') AS overdue_ratio
-- case when 做半段
