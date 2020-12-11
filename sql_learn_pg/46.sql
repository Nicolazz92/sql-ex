select distinct outcomes.ship, displacement, numguns
from outcomes
         join classes on outcomes.ship = classes.class
where battle = 'Guadalcanal'
  and outcomes.ship not in (select ships.name from ships)

union

select distinct outcomes.ship, displacement, numguns
from outcomes
         left join ships on outcomes.ship = ships.name
         left join classes on ships.class = classes.class
where battle = 'Guadalcanal'
  and outcomes.ship not in (
    select distinct outcomes.ship
    from outcomes
             join classes on outcomes.ship = classes.class
    where battle = 'Guadalcanal'
      and outcomes.ship not in (select ships.name from ships)
)