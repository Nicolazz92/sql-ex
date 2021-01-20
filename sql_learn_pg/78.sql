select name,
       to_char(date_trunc('month', date), 'yyyy-mm-dd')                                         first_day,
       to_char(date_trunc('month', date) + interval '1 month' - interval '1 day', 'yyyy-mm-dd') last_day
from battles
order by name