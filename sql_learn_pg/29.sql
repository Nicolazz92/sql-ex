select income_o.point,
       income_o.date,
       income_o.inc  income,
       outcome_o.out outcome
from income_o
         left join outcome_o on income_o.point = outcome_o.point and income_o.date = outcome_o.date

union

select outcome_o.point,
       outcome_o.date,
       income_o.inc  income,
       outcome_o.out outcome
from income_o
         right join outcome_o on income_o.point = outcome_o.point and income_o.date = outcome_o.date
