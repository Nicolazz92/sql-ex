select distinct product.maker, printer.price
from printer,
     product
where printer.model = product.model
  and printer.price = (select min(price) from printer where printer.color = 'y')
  and printer.color = 'y'