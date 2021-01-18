with country_ship as (select c.country, s.name ship
                      from classes c
                               inner join ships s on c.class = s.class
                      union
                      select c.country, o.ship
                      from classes c
                               inner join outcomes o on c.class = o.ship),

     country_ship_battle as (select country, country_ship.ship, battle
                             from country_ship
                                      inner join outcomes on outcomes.ship = country_ship.ship)

select country, battle
from classes,
     outcomes
union
select country, name
from classes,
     battles
    except
select country, battle
from country_ship_battle