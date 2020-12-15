with sunk_ships as (
    select classes.class, ships.name, result
    from classes
             inner join ships on classes.class = ships.class
             inner join outcomes on ships.name = outcomes.ship and result = 'sunk'
    union
    select classes.class, outcomes.ship, result
    from classes
             inner join outcomes on classes.class = outcomes.ship and result = 'sunk'
)

select classes.class, count(result)
from classes
         left join sunk_ships
                   on classes.class = sunk_ships.class
group by classes.class