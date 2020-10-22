select distinct p.maker, l.speed from product p, laptop l
where l.hd >= 10 and p.model = l.model;