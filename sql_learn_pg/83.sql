-- Определить названия всех кораблей из таблицы Ships, которые удовлетворяют, по крайней мере, комбинации любых четырёх критериев из следующего списка:
-- numGuns = 8
-- bore = 15
-- displacement = 32000
-- type = bb
-- launched = 1915
-- class=Kongo
-- country=USA

with name_conditions as (select name,
                                case when numguns = 8 then 1 else 0 end          _1,
                                case when bore = 15 then 1 else 0 end            _2,
                                case when displacement = 32000 then 1 else 0 end _3,
                                case when type = 'bb' then 1 else 0 end          _4,
                                case when launched = 1915 then 1 else 0 end      _5,
                                case when c.class = 'Kongo' then 1 else 0 end    _6,
                                case when country = 'USA' then 1 else 0 end      _7
                         from ships
                                  inner join classes c on c.class = ships.class)

select name
from name_conditions
where _1 + _2 + _3 + _4 + _5 + _6 + _7 >= 4