select distinct product.maker, avg(l.screen)
from product
         right join laptop l on product.model = l.model
group by maker