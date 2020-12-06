select distinct country, cast(avg(power(bor, 3) / 2) as numeric(6, 2)) as mw
from (
         select country, name, bore bor
         from ships
                  inner join classes on classes.class = ships.class

         union

         select country, ship, bore bor
         from outcomes
                  inner join classes on classes.class = outcomes.ship
     ) as bores
group by country;