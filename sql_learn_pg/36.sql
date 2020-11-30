select ships.name
from ships
         join classes on ships.name = classes.class
union
select outcomes.ship
from outcomes
         join classes on outcomes.ship = classes.class
