-- В наборе записей из таблицы PC, отсортированном по столбцу code (по возрастанию) найти среднее значение цены для каждой шестерки подряд идущих ПК.
-- Вывод: значение code, которое является первым в наборе из шести строк, среднее значение цены в наборе.

with pc_numbered as (select row_number() over (order by code) rn, * from pc),
     row_numbers as (select rn _rn from pc_numbered),
     order_mincode_avgprice as (select row_numbers._rn _order, min(pc_numbered.code) _mincode, avg(price) _avg
                                from row_numbers,
                                     pc_numbered
                                where pc_numbered.rn between row_numbers._rn and row_numbers._rn + 5
                                group by _order
                                having count(1) = 6
                                order by _order)

select _mincode, _avg from order_mincode_avgprice