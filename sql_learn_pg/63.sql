select passenger.name from passenger
join pass_in_trip pit on passenger.id_psg = pit.id_psg
group by passenger.name, pit.place
having count(passenger.id_psg) > 1