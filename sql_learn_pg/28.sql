select count(*)
from (select maker
      from product
      where model is not null
        and maker is not null
      group by maker
      having count(model) = 1
         and maker is not null) as rows