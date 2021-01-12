with bsc as (select battle, ship, country
             from battles
                      inner join outcomes o on battles.name = o.battle
                      inner join ships s on o.ship = s.name
                      inner join classes c on s.class = c.class

             union

             select battle, ship, country
             from battles
                      inner join outcomes o on battles.name = o.battle
                      inner join classes c on o.ship = c.class)

select distinct bsc.battle
from bsc
group by bsc.battle, bsc.country
having count(bsc.ship) >= 3