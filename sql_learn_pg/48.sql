select ships.class
from outcomes
         join ships on outcomes.ship = ships.name
         join classes on ships.class = classes.class
where outcomes.result = 'sunk'

union

select class
from outcomes
         join classes on outcomes.ship = classes.class
where outcomes.result = 'sunk'
