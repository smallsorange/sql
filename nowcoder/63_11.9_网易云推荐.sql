with subquery as (
    SELECT DISTINCT m.id, m.music_name
    FROM music_likes ml
    JOIN follow f ON ml.user_id = f.follower_id
    JOIN music m ON ml.music_id = m.id
    WHERE f.user_id = 1
    AND ml.music_id NOT IN (
        SELECT music_id
        FROM music_likes
        WHERE user_id = 1 
))
select music_name from subquery
order by id

-- 1.subquery
-- 2.from music_likes join follow on ml.user_id=f.follower_id join on music_id=m.id 三个表连接在一起
-- 3.where user_id=1 and not in (SELECT music_id
--         FROM music_likes
--         WHERE user_id = 1 )
-- 4.select order by 
