#1.筛选限制查询的范围,并给出排序（方便后面计算差值找相同）
with login_date as (
  select user_id,fdate,row_number() over (partition by user_id order by fdate) rn from tb_dau
where month(fdate)='1' and year(fdate)='2022')
#2.计算差值找相同点 date_sub减去日期后面对应的rn，应该得到同一天日期，如果是同一天说明是连续
,grp_date as(select user_id,fdate,date_sub(fdate,interval rn day) as grp from login_date) #用“日期−行号”构造分组键（连续日会落在同一 grp）

#3.分组找连续计数
,consecutive as (select user_id,grp,count(*) as consec_days from grp_date group by user_id,grp)
#4.找最大
select user_id,max(consec_days) as max_consecutive_days from consecutive
group by user_id
