-- Определить время, проведенное в полетах, для пассажиров, летавших всегда на разных местах. Вывод: имя пассажира, время в минутах.
with _pass as (select pass_in_trip.id_psg
               from pass_in_trip
               group by pass_in_trip.id_psg
               having count(distinct place) = count(place))

select passenger.name,
       sum(
                   extract(epoch from (
                           (case when time_in < time_out then time_in + interval '24 hours' else time_in end) - time_out
                       )) / 60
           )
from _pass
         inner join passenger on _pass.id_psg = passenger.id_psg
         inner join pass_in_trip on _pass.id_psg = pass_in_trip.id_psg
         inner join trip on pass_in_trip.trip_no = trip.trip_no
group by _pass.id_psg, name
order by name