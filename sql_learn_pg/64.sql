with joins as( select outcome.code, outcome.point, outcome.date, 'out' operation, outcome.out
from outcome
        left join income on outcome.date = income.date and outcome.point = income.point
where coalesce(income.inc, 0) = 0

union

select income.code, income.point, income.date, 'inc', income.inc
from income
    left join outcome on outcome.date = income.date and outcome.point = income.point
where coalesce(outcome.out, 0) = 0)

select point, date, operation, sum(out) from joins
group by point, date, operation