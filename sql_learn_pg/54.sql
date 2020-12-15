with all_ships as (
    select name, numguns, type
    from ships
             join classes c on c.class = ships.class
    union
    select ship, numguns, type
    from outcomes
             join classes on outcomes.ship = classes.class
)

select round(avg(numguns), 2)
from all_ships
where type = 'bb'