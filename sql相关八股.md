# rank之间的区别
row_number() over (parititon by order by) 不管并列直接123排序

rank() over 有并列会跳过并列的排名 113

dense_rank() over 有并列不跳过 112

# join之间的区别
INNER JOIN：只返回两个表都满足条件的匹配行。

常用在“必须都有数据”的场景，例如行为表联用户表。

LEFT JOIN：保留左表全部行，即便右表没有匹配也保留（右侧为 NULL）。

常用于需要保留“左侧主表”的情况，如计算留存时保留所有新注册用户。

RIGHT JOIN：保留右表全部行；与 LEFT JOIN 对称。实际较少使用。

FULL OUTER JOIN（MySQL 不支持，但大部分面试会问）：

返回左右两边所有行，不匹配的补 NULL。

CROSS JOIN：笛卡尔积，左表行数 × 右表行数。

用于生成日期序列、组合等。

SELF JOIN：一张表自己 join 自己，逻辑上仍然是 JOIN。


# 窗口函数partition by 与group by 的区别

GROUP BY 的本质是聚合：

将多行压成一行

每个分组只剩一条结果

非聚合字段必须出现在 group by 中

无法保留明细行

例：按用户求总收入 → 一条用户一行。

PARTITION BY 是窗口函数的分组：

不会减少行数

每一行都会计算窗口结果

可以同时保留明细行 + 分组聚合结果

常用于排序、排名、加总、移动平均等


# 常用的窗口函数有哪些

排名：row_number() rank() dense_rank()   聚合类：sum() over count() over avg() over max() over min() over 窗口偏移：lag()取前一行的值 lead()取后一行的值

# 时间相关的格式

date timestampdiff datediff date_sub date_add month year date_format

DATE()：从 datetime 中提取日期部分。

DATEDIFF(date1, date2)：date1 - date2 的天数差。

TIMESTAMPDIFF(unit, t1, t2)：按 unit（hour, minute, day）计算差值，更灵活。

DATE_SUB(date, INTERVAL n DAY)：日期往前推 n 天。

DATE_ADD(date, INTERVAL n DAY)：日期往后推 n 天。

MONTH(date)：提取月份（1–12）。

YEAR(date)：提取年份（如 2025）。

DATE_FORMAT(date, '%Y-%m')：格式化日期为指定格式，例如转成 “2025-01”。



# cast round

CAST 用于类型转换：

CAST(x AS SIGNED)：转为整数

CAST(x AS CHAR)：转字符串

CAST(x AS DECIMAL(10,2))：转为两位小数

常用于时间戳 → 日期、字符串 → 数字、浮点数精度控制。



ROUND(x, d) 用于四舍五入：

# sql运行逻辑
FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY → LIMIT

