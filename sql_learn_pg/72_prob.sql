with ptn as (select passenger.name, passenger.id_psg, t.trip_no, c.name company
             from passenger
                      inner join pass_in_trip pit on passenger.id_psg = pit.id_psg
                      inner join trip t on pit.trip_no = t.trip_no
                      inner join company c on t.id_comp = c.id_comp),

     users_of_one_company as (select ptn.id_psg
                              from ptn
                              group by ptn.id_psg
                              having count(distinct ptn.company) = 1),

     pass_name_id_count as (select ptn.name, ptn.id_psg, count(ptn.trip_no) count
                            from ptn
                            where ptn.id_psg in (select * from users_of_one_company)
                            group by ptn.name, ptn.id_psg)

select name, count
from pass_name_id_count
where count = (select max(count) from pass_name_id_count)