-- Collect 80 gold
while hero.gold < 80 do
    local coin = hero:findNearestItem()
    hero:move(coin.pos)
end

-- Build 4 soldiers to use as bait
for i=1,4 do
    hero:summon("soldier")
end

-- Send your soldiers into position
local points = {}
points[1] = {x=13, y=73}
points[2] = {x=51, y=73}
points[3] = {x=51, y=53}
points[4] = {x=90, y=52}
local friends = hero:findFriends()

-- Match the friends to the points and command them to move
for j=1,4 do
    local friend = friends[j]
    local point = points[j]
    hero:command(friend, "move", point)
end
