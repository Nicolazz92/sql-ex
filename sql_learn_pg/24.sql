with models as (
    select model, price
    from laptop
    union
    select model, price
    from pc
    union
    select model, price
    from printer
)

select distinct model
from models
where price = (
    select max(price)
    from models)