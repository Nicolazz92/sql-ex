-- Определить дни, когда было выполнено максимальное число рейсов из Ростова ('Rostov'). Вывод: число рейсов, дата.

with trip_from_rostov as (select date, town_from, count(distinct pit.trip_no) qty
                          from trip
                                   inner join pass_in_trip pit on trip.trip_no = pit.trip_no
                          where town_from = 'Rostov'
                          group by date, town_from)

select qty, date
from trip_from_rostov
where qty = (select max(qty) from trip_from_rostov)