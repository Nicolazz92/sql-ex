select income_o.point,
       income_o.date,
       case when income_o.inc is null then 'NULL' else cast(income_o.inc AS varchar) end   income,
       case when outcome_o.out is null then 'NULL' else cast(outcome_o.out AS varchar) end outcome
from income_o
         left join outcome_o on income_o.point = outcome_o.point and income_o.date = outcome_o.date

union

select outcome_o.point,
       outcome_o.date,
       case when income_o.inc is null then 'NULL' else cast(income_o.inc AS varchar) end   income,
       case when outcome_o.out is null then 'NULL' else cast(outcome_o.out AS varchar) end outcome
from income_o
         right join outcome_o on income_o.point = outcome_o.point and income_o.date = outcome_o.date
