-- Q：找出哪一类地点（place_category）拥有最多被标记为 “off-topic” 的 UGC（用户生成内容）
WITH nums AS (
  SELECT
    p.place_category,
    COUNT(*) AS content_count
  FROM maps_ugc_review AS m
  JOIN place_info        AS p
    ON m.place_id = p.place_id
  WHERE m.content_tag = 'Off-topic'
  GROUP BY p.place_category
),
ranked AS (
  SELECT
    place_category,
    content_count,
    RANK() OVER (ORDER BY content_count DESC, place_category ASC) AS rnk
  FROM nums
)
SELECT place_category AS off_topic_places
FROM ranked
WHERE rnk = 1
ORDER BY place_category;

-- 1.nums from join连接表 ➡️where content_tag=off➡️group by place_categroy➡️count（）
-- 2.rank over order by count 
-- 3.where rk=1 order by place_category select xx as off_topics_places
