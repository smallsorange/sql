-- 会员用户如果下订单金额大于100则可获得同订单金额相同数额的积分，请根据这几日订单数据更新用户会员等级表中积分信息。
-- 要求输出：user_id,积分

select o.user_id,sum(order_price)+point as point
from order_tb as o left join uservip_tb u on o.user_id=u.user_id
where order_price>100
group by o.user_id
order by point desc

