with all_ships as (
    select name, class
    from ships
    union
    select ship, ship
    from outcomes
),

     classes_and_ships as (select cl.class, all_ships.name
                           from classes cl
                                    inner join all_ships on cl.class = all_ships.class),

     classes_with_3_and_more_ships as (
         select classes_and_ships.class
         from classes_and_ships
         group by classes_and_ships.class
         having count(name) >= 3
     )

select classes_and_ships.class, count(classes_and_ships.name)
from classes_and_ships
         inner join outcomes on classes_and_ships.name = outcomes.ship
    and outcomes.result = 'sunk'
group by classes_and_ships.class
having classes_and_ships.class in (
    select c.class
    from classes_with_3_and_more_ships c
)