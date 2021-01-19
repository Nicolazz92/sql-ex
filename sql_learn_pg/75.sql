with makers as (select maker, l.model
                from product
                         inner join laptop l on product.model = l.model
                where l.price is not null

                union

                select maker, p.model
                from product
                         inner join pc p on product.model = p.model
                where p.price is not null

                union

                select maker, p2.model
                from product
                         inner join printer p2 on product.model = p2.model
                where price is not null)

select makers.maker, max(laptop.price) laptop, max(pc.price) pc, max(printer.price) printer
from makers
         left join laptop on makers.model = laptop.model
         left join pc on makers.model = pc.model
         left join printer on makers.model = printer.model
group by makers.maker
order by makers.maker