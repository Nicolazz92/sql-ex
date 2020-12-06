select name
from ships
         inner join classes on classes.class = ships.class
where type = 'bb'
  and launched >= 1922
  and displacement > 35000;