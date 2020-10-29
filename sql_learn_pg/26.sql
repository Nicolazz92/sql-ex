select avg(price)
from (
         select price
         from pc
                  join product p on pc.model = p.model and maker = 'A'
         union all
         select price
         from laptop
                  join product p2 on p2.model = laptop.model and maker = 'A'
     ) as prices