select avg(speed)
from pc
         left join product p on p.model = pc.model
where p.maker = 'A'