select distinct pc1.model, pc2.model, pc1.speed, pc1.ram
from pc pc1,
     pc pc2
where pc1.speed = pc2.speed
  and pc1.ram = pc2.ram
  and pc1.model <> pc2.model
  and pc1.model > pc2.model
order by pc2.model, pc1.speed, pc1.ram