select classes.class, min(ships.launched)
from classes
         left join ships on classes.class = ships.class
group by classes.class;