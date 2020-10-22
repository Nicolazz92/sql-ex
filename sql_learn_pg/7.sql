select distinct p.model, l.price
from product p
         join laptop l on p.model = l.model
where p.maker='B'

UNION

select distinct p.model, pc.price
from product p
         join pc on p.model = pc.model
where p.maker='B'

UNION

select distinct p.model, prin.price
from product p
         join printer prin on p.model = prin.model
where p.maker='B'
