with all_ships as (
    select name, country
    from ships
             join classes c on c.class = ships.class
    union
    select ship, country
    from outcomes
             join classes on outcomes.ship = classes.class
),

     sunk_ships as (
         select ship, country
         from outcomes
                  join ships on outcomes.ship = ships.name
                  join classes on ships.class = classes.class
         where outcomes.result = 'sunk'

         union

         select ship, country
         from outcomes
                  join classes on outcomes.ship = classes.class
         where outcomes.result = 'sunk'
     )

select country
from all_ships
group by country
having count(name) = (select count(ship) from sunk_ships where sunk_ships.country = all_ships.country)