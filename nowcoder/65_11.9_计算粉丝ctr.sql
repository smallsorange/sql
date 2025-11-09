select count(a.fans_id)/sum(show_num) as fans_ctr
from a join b on a.author_id=b.author_id join c on b.content_id=c.content_id
where a.fans_id = c.fans_id

-- 1.join abc三个表
-- 2.where a.fans_id=c.fans_id
-- 3.count/sum(show_num)
