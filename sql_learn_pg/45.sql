select name
from (select name
      from ships
      union
      select ship
      from outcomes) names
where name similar to '% % %'