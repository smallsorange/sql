select category as product_category,age_group,sum(quantity*price) as total_sales_amount,
round(sum(quantity*price)/sum(sum(quantity*price)) over (partition by category),2) as purchase_percentage
from sales s left join products p on p.product_id=s.product_id
left join customer_info c on s.sale_id=c.sale_id
group by category,age_group
order by category,purchase_percentage desc

--round(sum(quantity*price)/sum(sum(quantity*price)) over (partition by category),2) as purchase_percentage
-- 重点：sum(price*quantity) 这一类的总价 /sum( sum（quantity*price）) over (partition by category) 计算总价，并按照分类，再每一行后面输出总体结果
