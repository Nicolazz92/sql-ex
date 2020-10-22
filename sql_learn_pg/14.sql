select ships.class, name, c.country
from ships
         join classes c on ships.class = c.class
where numguns >= 10