-- select maker
-- from product
--          join pc on product.model = pc.model
--     except
-- select maker
-- from product
--          join laptop on product.model = laptop.model


select distinct product.maker from product where product.type = 'PC'
except
select distinct product.maker from product where product.type = 'Laptop'
