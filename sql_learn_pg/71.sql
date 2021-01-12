with pcs as (select model, maker
             from product
             where type = 'PC')

select distinct pcs1.maker
from pcs pcs1
where 0 = (select count(*)
           from (
                    select distinct pcs2.model
                    from pcs pcs2
                    where pcs2.maker = pcs1.maker
                        except
                    select distinct pc1.model
                    from pc pc1
                ) x
)