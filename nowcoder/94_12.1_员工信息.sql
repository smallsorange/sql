# SELECT
#     i.EMPLOYEE_ID,
#     CASE 
#         WHEN i.LAST_UPDATE_DT >= u.UPDATE_DT THEN i.POSITION 
#         ELSE u.NEW_POSITION 
#     END AS POSITION,
#     CASE 
#         WHEN i.LAST_UPDATE_DT >= u.UPDATE_DT THEN i.LAST_UPDATE_DT 
#         ELSE u.UPDATE_DT 
#     END AS LAST_UPDATE_DT
# FROM 
#     EMPLOYEE_INFO i
# JOIN (
#     SELECT
#         EMPLOYEE_ID,
#         ROW_NUMBER() OVER (PARTITION BY EMPLOYEE_ID ORDER BY UPDATE_DT DESC) AS rk,
#         UPDATE_DT,
#         NEW_POSITION
#     FROM
#         EMPLOYEE_UPDATE
# ) u ON i.EMPLOYEE_ID = u.EMPLOYEE_ID
# WHERE 
#     rk = 1
# ORDER BY
#     EMPLOYEE_ID ASC;

# 1.case when  last_update_dt>=update_dt then position else NEW_POSITION
# if(,position,new_position)
# 2.from i join 最新的更新表
# 3.where rk=1
select ei.EMPLOYEE_ID,if(LAST_UPDATE_DT>=UPDATE_DT,POSITION,NEW_POSITION) as POSITION,IF(LAST_UPDATE_DT>=UPDATE_DT,LAST_UPDATE_DT,UPDATE_DT) AS LAST_UPDATE_DT
from EMPLOYEE_INFO ei join (
select EMPLOYEE_ID,NEW_POSITION,UPDATE_DT,ROW_NUMBER() over (partition by EMPLOYEE_ID order by UPDATE_DT desc) rk
from EMPLOYEE_UPDATE
) eu 
on eu.EMPLOYEE_ID=ei.EMPLOYEE_ID
WHERE rk=1
ORDER BY EMPLOYEE_ID
# 1.from EMPLOYEE_INFO join 更新表中最新更新的内容 记上rk 后续判断谁第一个
# 2.where rk=1（最大的UPDATE_TIME）
# 3.select 判断谁的时间更后面
