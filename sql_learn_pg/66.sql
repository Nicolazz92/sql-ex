with dates as (
    select * from generate_series('2003-04-01'::timestamp, '2003-04-07'::timestamp, '1 day'::interval)
),

     date_rostov_trip as (select distinct date, pass_in_trip.trip_no
                          from pass_in_trip
                                   join trip t on t.trip_no = pass_in_trip.trip_no
                          where date in (select * from dates)
                            and t.town_from = 'Rostov')

select dates.generate_series, count(date_rostov_trip.trip_no)
from dates
         left join date_rostov_trip on dates.generate_series = date_rostov_trip.date
group by dates.generate_series
order by generate_series;