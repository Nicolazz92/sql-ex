with all_ships as (
    select name, numguns, displacement
    from ships
             join classes c on c.class = ships.class
    union
    select ship, numguns, displacement
    from outcomes
             join classes on outcomes.ship = classes.class
),
     all_numguns as (
         select displacement, max(numguns) max_numgun
         from all_ships
         group by displacement
     )

select name
from all_ships
         join all_numguns on all_ships.displacement = all_numguns.displacement
    and all_ships.numguns = all_numguns.max_numgun