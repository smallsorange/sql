with ranked as (
  select date(measurement_time) as measurement_day,
  measurement_value,
  row_number() over (partition by date(measurement_time) order by measurement_time) as rk
  from measurements
  )
select measurement_day,round(sum(case when(mod(rn,2)=1 then measurement_value else 0 end),
  round(sum(case when(mod(rn,2)=0 then measurement_value else 0 end)
from ranked
group by measurement_day
order by measurement_day
-- 任务目标：按照天把1、3、5次测量归位odd，2、4、6次测量归位even 然后分别求和
-- 1.as ranked   date()，row_number() over partition by date order by date 排名按照不同天的第不同次排名
-- 2.from ranked group by date sum（case when(mod(rn,2)=1 then value else 0））当排名是奇数odd的时候then value
