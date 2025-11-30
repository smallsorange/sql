select cust_name,o.order_num,sum(quantity*item_price) OrderTotal
from Customers c join Orders o on c.cust_id=o.cust_id join OrderItems oi on o.order_num=oi.order_num
group by cust_name,o.order_num
order by cust_name,order_num

