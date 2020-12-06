select distinct product.maker
from product
where product.type = 'PC'
    except
select distinct product.maker
from product
where product.type = 'Laptop'
