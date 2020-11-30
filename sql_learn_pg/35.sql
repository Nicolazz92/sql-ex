select model, type
from product where upper(model) not similar to '%[^A-Z]%'
or upper(model) not similar to '%[^0-9]%'