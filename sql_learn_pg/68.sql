with trip_count as (select greatest(town_from, town_to) || least(town_from, town_to) appended, count(trip_no) _count
                    from trip
                    group by appended)

select count(1)
from trip_count tc
where tc._count >= all (select _count from trip_count);