select product.maker, count(1)
from product
where type = 'PC'
group by product.maker
having count(1) >= 3