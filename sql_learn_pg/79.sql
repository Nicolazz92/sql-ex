-- Определить пассажиров, которые больше других времени провели в полетах.
-- Вывод: имя пассажира, общее время в минутах, проведенное в полетах

with pass_time as (select passenger.name,
                          sum(
                                      extract(epoch from (
                                              (case
                                                   when time_in < time_out then time_in + interval '24 hours'
                                                   else time_in end) - time_out
                                          )) / 60
                              ) _time
                   from passenger
                            inner join pass_in_trip on passenger.id_psg = pass_in_trip.id_psg
                            inner join trip on pass_in_trip.trip_no = trip.trip_no
                   group by pass_in_trip.id_psg, name)
select name, _time from pass_time
where _time >= all (select _time from pass_time)