select distinct p.maker
from product p
         join pc on p.model = pc.model
where pc.speed >= 450