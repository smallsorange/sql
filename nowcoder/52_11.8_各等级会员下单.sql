select vip,sum(if(order_price,order_price,0)) as order_total
from order_tb o right join uservip_tb u on o.user_id=u.user_id
group by vip
order by order_total desc

-- sum(if(order_price,order_price,0))
-- 如果 order_price 有值 → 用它本身；
-- 如果 order_price 为 NULL 或 0 → 用 0；
-- 最后再 SUM() 求总和。

coalesce(sum(order_price),0)等价于：
CASE WHEN order_price IS NULL THEN 0 ELSE order_price END
