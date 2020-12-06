select distinct p.maker, l.speed
from product p
         join laptop l on p.model = l.model
where l.hd >= 10;