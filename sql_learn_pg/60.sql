-- Посчитать остаток денежных средств на начало дня 15/04/01 на каждом пункте приема для базы данных с отчетностью не чаще одного раза в день. Вывод: пункт, остаток.
-- Замечание. Не учитывать пункты, информации о которых нет до указанной даты.

with income_sum as (select inc1.point, sum(inc1.inc) sum
                    from income_o inc1
                    where inc1.date < date '2001-04-15'
                    group by inc1.point),
     outcome_sum as (select out1.point, sum(out1.out) sum
                     from outcome_o out1
                     where out1.date < date '2001-04-15'
                     group by out1.point),
     points as (select income_o.point from income_o union select outcome_o.point from outcome_o)

select points.point, coalesce(income_sum.sum, 0) - coalesce(outcome_sum.sum, 0) remain
from points
         full join income_sum on points.point = income_sum.point
         full join outcome_sum on points.point = outcome_sum.point
where income_sum.sum is not null
   or outcome_sum.sum is not null
order by points.point