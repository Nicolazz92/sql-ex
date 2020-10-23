select distinct product.maker
from product
         inner join pc on product.model = pc.model
where pc.speed >= 750

INTERSECT

select distinct product.maker
from product
         inner join laptop on product.model = laptop.model
where laptop.speed >= 750