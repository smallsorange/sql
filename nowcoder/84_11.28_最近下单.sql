select order_id,customer_name,order_date
from (
    select order_id,c.customer_id,customer_name,order_date,
    rank() over (partition by customer_name order by order_date desc) rk
    from orders o join customers c on o.customer_id=c.customer_id
) t
where rk = 1
-- 1.join
-- 2.rank排序 partition by customer_name
-- 3.where rk=1
