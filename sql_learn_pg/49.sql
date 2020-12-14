select ships.name
from ships
         join classes on ships.class = classes.class
where classes.bore = 16

union

select class
from outcomes
         join classes on outcomes.ship = classes.class
where classes.bore = 16
