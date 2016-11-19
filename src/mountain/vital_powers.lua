-- This level shows how to define your own functions.
-- The code inside a function is not executed immediately. It's saved for later.
-- This function has your hero collect the nearest coin.
-- NOTE: This solution does not pass the bonus goals. This code may run SLOW, because of the loop-within-a-loop
-- method in the code.
local function pickUpNearestCoin()
    local items = self:findItems()
    local nearestCoin = self:findNearest(items)
    if nearestCoin then
        self:move(nearestCoin.pos)
    end
end

-- This function has your hero summon a soldier.
local summonSoldier = function()
    -- Fill in code here to summon a soldier if you have enough gold.
    if (self.gold > self:costOf("soldier")) then
        self:summon("soldier")
    end
end

-- This function commands your soldiers to attack their nearest enemy.
local commandSoldiers = function()
    local friends = self:findFriends()
    for i=1, #friends do
        local soldier = friends[i]
        local enemy = soldier:findNearestEnemy()
        if enemy then
            self:command(soldier, "attack", enemy)
        end
    end
end

loop
    -- In your loop, you can "call" the functions defined above.
    -- The following line causes the code inside the "pickUpNearestCoin" function to be executed.
    pickUpNearestCoin()
    -- Call summonSoldier here
    summonSoldier()
    -- Call commandSoldiers here
    commandSoldiers()
end
