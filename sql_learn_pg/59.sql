-- Посчитать остаток денежных средств на каждом пункте приема для базы данных с отчетностью не чаще одного раза в день. Вывод: пункт, остаток.

with income_sum as (select inc1.point, sum(inc1.inc) sum
                    from income_o inc1
                    group by inc1.point),
     outcome_sum as (select out1.point, sum(out1.out) sum
                     from outcome_o out1
                     group by out1.point),
     points as (select income_o.point from income_o union select outcome_o.point from outcome_o)

select points.point, coalesce(income_sum.sum, 0) - coalesce(outcome_sum.sum, 0) remain
from points
         full join income_sum on points.point = income_sum.point
         full join outcome_sum on points.point = outcome_sum.point
order by points.point