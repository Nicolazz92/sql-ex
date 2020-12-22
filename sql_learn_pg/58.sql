with maker_and_type as (select distinct prod1.maker, prod2.type
                        from product prod1,
                             product prod2)

select mat.maker,
       mat.type,
       to_char(
               (cast(count(prod3.model) as real)
                    / cast((select count(model) from product prod4 where prod4.maker = mat.maker) as real)
                   * 100)
           , '990.00')
from maker_and_type mat
         left join product prod3 on mat.maker = prod3.maker and mat.type = prod3.type
group by mat.maker, mat.type