-- Protect the cage.
-- Put a soldier at each X.
local maxnum = 4
local points = {}
points[1] = {x=33, y=42}
points[2] = {x=47, y=42}
points[3] = {x=33, y=26}
points[4] = {x=47, y=26}

-- 1. Collect 80 gold.
while self.gold < 80 do
    local coin = self:findNearestItem()
    self:move(coin.pos)
end

-- 2. Build 4 soldiers.
for i = 1,maxnum do
    self:summon("soldier")
end

-- 3. Send your soldiers into position.
while true do
    local friends = self:findFriends()
    for j = 1,#friends do
        local point = points[j]
        local friend = friends[j]
        local enemy = friend:findNearestEnemy()
        if enemy and enemy.team == "ogres" and friend:distanceTo(enemy) < 5 then
            -- Command friend to attack.
            self:command(friend, "attack", enemy)
        else
            -- Command friend to move to point.
            self:command(friend, "move", point)
        end
    end
end
