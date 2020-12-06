select distinct first_out.ship
from battles firts_battle
         join outcomes first_out on firts_battle.name = first_out.battle
where first_out.result = 'damaged'
  and exists(select second_out.ship, second_battle.date
             from battles second_battle
                      inner join outcomes second_out
                                 on second_battle.name = second_out.battle
             where second_battle.date > firts_battle.date
               and second_out.ship = first_out.ship)