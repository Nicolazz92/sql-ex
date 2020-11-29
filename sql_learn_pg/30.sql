select point, date, sum(outc), sum(inc)
from (select income.point point,
             income.date  date,
             income.inc   inc,
             null outc
      from income

      union all

      select outcome.point point,
             outcome.date  date,
             null   inc,
             outcome.out  outc
      from outcome
     ) data
group by date, point