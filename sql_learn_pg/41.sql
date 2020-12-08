with maker_price as (
    select maker, price
    from product
             join pc on product.model = pc.model
    union all
    select maker, price
    from product
             join laptop on product.model = laptop.model
    union all
    select maker, price
    from product
             join printer on product.model = printer.model
)

select distinct maker, max(price)
from maker_price
group by maker
having maker not in (select distinct maker from maker_price where price is null)

union

select distinct maker, price
from maker_price
where price is null;
