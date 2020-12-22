-- Посчитать остаток денежных средств на всех пунктах приема на начало дня 15/04/01 для базы данных с отчетностью не чаще одного раза в день.

with income_sum as (select sum(inc1.inc) sum
                    from income_o inc1
                    where inc1.date < date '2001-04-15'),
     outcome_sum as (select sum(out1.out) sum
                     from outcome_o out1
                     where out1.date < date '2001-04-15')

select coalesce(income_sum.sum, 0) - coalesce(outcome_sum.sum, 0) remain
from income_sum,
     outcome_sum
