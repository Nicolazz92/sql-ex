-- Найти производителей любой компьютерной техники, у которых нет моделей ПК, не представленных в таблице PC.

with pc_maker_not_in_pc_table as (select distinct maker from product
left join pc on product.model = pc.model
where product.type = 'PC' and pc.model is null)

select maker from product
except (select maker from pc_maker_not_in_pc_table)