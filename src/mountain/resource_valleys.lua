-- Collect all the coins!
-- The peasants are unable to get the coins from other areas
-- However, each area only spawns a certain value of coin!
-- Filter through all the items and command the peasants accordingly.

local function commandPeasant(peasant, coins)
    -- Command the peasant to the nearest of their array
    local coin = peasant:findNearest(coins)
    if coin then
        hero:command(peasant, "move", coin.pos)
    end
end

local friends = hero:findFriends()
local peasants = {
    "Aurum"=friends[1],
    "Argentum"=friends[2],
    "Cuprum"=friends[3]
}

local goldIndex = 1
local silverIndex = 1
local bronzeIndex = 1

while true do
    local items = hero:findItems()
    local goldCoins = {}
    local silverCoins = {}
    local bronzeCoins = {}
    for i = 1, #items do
        local item = items[i]
        if item.value == 3 then
            goldCoins[goldIndex] = item
            goldIndex = goldIndex + 1
        -- Put bronze and silver coins in their approriate array:
        elseif item.value == 2 then
            silverCoins[silverIndex] = item
            silverIndex = silverIndex + 1
        elseif item.value == 1 then
            bronzeCoins[bronzeIndex] = item
            bronzeIndex = bronzeIndex + 1
        end
    end
    commandPeasant(peasants['Aurum'], goldCoins)
    commandPeasant(peasants['Argentum'], silverCoins)
    commandPeasant(peasants['Cuprum'], bronzeCoins)
end
