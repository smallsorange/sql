select g.id,name,weight,sum(count) as total
from goods g left join trans t on g.id=t.goods_id
group by g.id
having sum(count)>20 and weight<50
order by id
