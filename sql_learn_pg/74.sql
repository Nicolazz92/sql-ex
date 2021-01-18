select country, class ship_class
from classes
where upper(country) = upper('russia')
union
select country, class ship_class
from classes
where not upper('russia') = any (select upper(country) from classes)