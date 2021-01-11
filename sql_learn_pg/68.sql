with trip_count as (select hashtext(town_from) / 10000 + hashtext(town_to) / 10000 hash, count(trip_no) _count
                    from trip
                    group by hash)

select count(1)
from trip_count tc
where tc._count >= all (select _count from trip_count)