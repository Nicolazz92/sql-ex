with trip_count as (select town_from, town_to, count(trip_no) _count
                    from trip
                    group by town_from, town_to)

select count(1)
from trip_count tc
where tc._count >= all (select _count from trip_count)