select name
from ships
         inner join classes c on ships.class = c.class
    and (c.type is null or c.type = 'bb')
    and (c.country is null or c.country = 'Japan')
    and (c.numguns is null or c.numguns >= 9)
    and (c.bore is null or c.bore < 19)
    and (c.displacement is null or c.displacement <= 65000)