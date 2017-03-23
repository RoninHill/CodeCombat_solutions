-- Fight enemies for 15 seconds.
-- Keep count whenever an enemy is defeated.
local defeated = 0
while true do
    local enemy = hero:findNearestEnemy()
    if enemy then
        hero:attack(enemy)
        if enemy.health <= 0 then
            defeated = defeated + 1
        end
    end
    if hero:now() > 15 then
        break
    end
end

-- Tell Naria how many enemies you defeated.
self:say("Slew " + defeated + " enemies, Naria!")

-- Collect coins until the clock reaches 30 seconds.
while true do
    local coin = hero:findNearestItem()
    if coin then
        hero:moveXY(coin.pos.x, coin.pos.y)
    end
    if hero:now() > 30 then
        break
    end
end
-- Tell Naria how much gold you collected.
self:say("Got " + hero.gold + " gold!")

-- Fight enemies until the clock reaches 45 seconds.
-- Remember to reset the count of defeated enemies!
defeated = 0
while true do
    local enemy = hero:findNearestEnemy()
    if enemy then
        hero:attack(enemy)
        if enemy.health <= 0 then
            defeated = defeated + 1
        end
    end
    if hero:now() > 45 then
        break
    end
end

-- Tell Naria how many enemies you defeated.
self:say("Slew " + defeated + " enemies!")
