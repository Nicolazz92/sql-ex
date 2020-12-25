with types as (select distinct case
                                   when type = 'PC' then 0
                                   when type = 'Laptop' then 1
                                   when type = 'Printer' then 2
                                   end type_number,
                               maker,
                               type
               from product
               order by maker, type_number)

select row_number() over (),
       case
           when type_number = (select min(tt.type_number) from types tt where types.maker = tt.maker) then maker
           else ''
           end,
       type
from types