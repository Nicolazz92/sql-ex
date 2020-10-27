select distinct model
from (select model, price
      from laptop
      union
      select model, price
      from pc
      union
      select model, price
      from printer
     ) as models
where price = (
    select max(price)
    from (select price
          from laptop
          union
          select price
          from laptop
          union
          select price
          from laptop
         ) as prices)