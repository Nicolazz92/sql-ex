select class
from (select class, name
      from ships
      union
      select classes.class, outcomes.ship
      from classes
               join outcomes on classes.class = outcomes.ship) cl
group by class
having count(*) = 1