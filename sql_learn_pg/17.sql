select distinct pr.type, l.model, l.speed
from laptop l,
     product pr
where l.speed < (select min(speed) from pc)
  and l.model = pr.model