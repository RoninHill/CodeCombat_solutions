-- Summon some soldiers, then direct them to your base.

-- Each soldier costs 20 gold.
while (hero.gold > hero:costOf("soldier")) do
    hero:summon("soldier")
end
    
local soldiers = hero:findFriends()
local soldierIndex = 1 -- Lua starts counting at 1.

-- Add a while loop to command all the soldiers.
while soldierIndex <= #soldiers do
    local soldier = soldiers[soldierIndex]
    hero:command(soldier, "move", {x=50, y=40})
    soldierIndex = soldierIndex + 1
end
-- Go join your comrades!
while true do
    hero:move({x=50, y=40})
end
