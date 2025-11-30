select customer_id,customer_name,product_name as latest_order
from (
    select c.customer_id,customer_name,product_name,row_number() over (partition by customer_id,customer_name order by order_date desc) rk
from orders o left join customers c on o.customer_id=c.customer_id
right join products p on o.product_id=p.product_id

) t 
where rk=1
order by customer_id

-- 1.join tb
-- 2.row_number() over (partition by customer_id,customer_name order by order_date)
-- 3.from where rk=1
-- 4.select  order 
