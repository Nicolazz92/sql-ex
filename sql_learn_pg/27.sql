select maker, avg(hd)
from product
         join pc on product.model = pc.model
    and maker in (select maker
                  from product
                  where type = 'Printer')
group by maker