select cast(avg(abs(timestampdiff(second,ol.logtime,sl.logtime))) as signed) as gap
from order_log ol left join select_log as sl on ol.order_id=sl.order_id


-- 注意这里不能用round，否则会保留浮点数，需要用cast as signed 强制保留成整数
-- round(,2)可以用作保留2位小数但是不能保存位整数

-- timestampdiff 是int类型
-- avg（）是float类型
-- 因为 ROUND() 返回的是 浮点数，只是小数部分被四舍五入
-- cast相当于转换格式，
-- SELECT CAST('2025-11-09' AS DATE);
-- SELECT CAST('123' AS SIGNED);
-- SELECT CAST(3.14159 AS DECIMAL(10,2));
-- cast（xx as unsigned）转为无符号整数（仅正数） signed有符号
