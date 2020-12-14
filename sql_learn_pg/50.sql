select distinct battles.name
from battles
         join outcomes o on battles.name = o.battle
         join ships s on o.ship = s.name
         join classes c on s.class = c.class
where c.class = 'Kongo'