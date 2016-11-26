-- Hushbaum has been ambushed by ogres!
-- She is busy healing her soldiers, you should command them to fight!
-- The ogres will send more troops if they think they can get to Hushbaum or your archers, so keep them inside the circle!

-- Soldiers spread out in a circle and defend.
local function commandSoldier(soldier, soldierIndex, numSoldiers)
    local angle = Math.PI * 2 * soldierIndex / numSoldiers
    local librarian = self:findNearest(self:findByType("librarian"))
    local defendPos = {"x"=librarian.pos.x, "y"= librarian.pos.y}
    defendPos['x'] = defendPos.x + 10 * Math.cos(angle)
    defendPos['y'] = defendPos.y + 10 * Math.sin(angle)
    self:command(soldier, "defend", defendPos)
end

-- Find the strongest target (most health)
-- This function returns something! When you call the function, you will get some value back.
local function findStrongestTarget()
    local mostHealth = 0
    local bestTarget = nil
    local enemies = self:findEnemies()
    -- Figure out which enemy has the most health, and set bestTarget to be that enemy.
    for i=1, #enemies do
        local enemy = enemies[i]
        if enemy.health > mostHealth then
            bestTarget = enemy
            mostHealth = enemy.health
        end
    end
    -- Only focus archers' fire if there is a big ogre.
    if bestTarget and bestTarget.health > 15 then
        return bestTarget
    else
        return nil
    end
end

-- If the strongestTarget has more than 15 health, attack that target. Otherwise, attack the nearest target.
local function commandArcher(archer, archerIndex, numArchers)
    -- If archerTarget is defeated or doesn't exist, find a new one.
    -- Set archerTarget to be the target that is returned by findStrongestTarget()
    if not archerTarget or archerTarget.health <= 0 then 
        archerTarget = findStrongestTarget()
    end
    -- If strongest target isn't available, get nearest enemy.
    local nearest = archer:findNearestEnemy()
    if archerTarget then
        self:command(archer, "attack", archerTarget)
    elseif nearest then
        self:command(archer, "attack", nearest)
    else
        local angle = Math.PI * 2 * archerIndex / numArchers
        local librarian = self:findNearest(self:findByType("librarian"))
        local defendPos = {"x"=librarian.pos.x, "y"=librarian.pos.y }
        defendPos['x'] = defendPos.x + 5 * Math.cos(angle)
        defendPos['y'] = defendPos.y + 5 * Math.sin(angle)
        self:command(archer, "move", defendPos)
    end
end

local archerTarget = nil
local friends = self:findFriends()
local soldiers = self:findByType("soldier")
local archers = self:findByType("archer")

-- Create a variable containing your archers.
loop
    for i, soldier in pairs(soldiers) do
        commandSoldier(soldier, i, #soldiers)
    end

    -- use commandArcher() to command your archers
    for i, archer in pairs(archers) do
        commandArcher(archer, i, #archers)
    end
end
