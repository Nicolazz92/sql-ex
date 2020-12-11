select name
from battles
where extract(year from date) not in (select launched from ships where launched is not null);