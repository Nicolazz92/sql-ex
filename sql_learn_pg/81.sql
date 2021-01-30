-- Из таблицы Outcome получить все записи за тот месяц (месяцы), с учетом года, в котором суммарное значение расхода (out) было максимальным.

with out_per_year_month as (select sum(out) _sum, date_trunc('year', date) _year, date_trunc('month', date) _month
                            from outcome
                            group by _year, _month
                            order by _sum desc),
     max_out_year_month as (select * from out_per_year_month where _sum = (select max(_sum) from out_per_year_month))

select code, point, date, out
from outcome
         inner join max_out_year_month
                    on date_trunc('year', date) = max_out_year_month._year
                        and date_trunc('month', date) = max_out_year_month._month