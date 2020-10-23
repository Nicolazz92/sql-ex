select product.maker, max(p.price)
from product
         join pc p on product.model = p.model
group by product.maker