with min_ram_max_speed as (
    select min(ram) minram, max(speed) maxspeed, model
    from pc
    group by ram, speed, model
    order by minram, speed desc
    limit 1
),
     printer_makers as (
         select maker
         from product
         where type = 'Printer'
     )
select distinct maker
from product
         join pc on product.model = pc.model
where pc.ram in (select minram from min_ram_max_speed)
  and pc.speed in (select maxspeed from min_ram_max_speed)
  and product.maker in (
    select *
    from printer_makers
)