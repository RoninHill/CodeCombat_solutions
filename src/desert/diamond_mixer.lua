-- Claim the coins while defeating the marauding ogres.

local function findMostHealth(enemies)
    local target = nil
    local targetHealth = 0
    local enemyIndex = 1
    while enemyIndex <= #enemies do
        local enemy = enemies[enemyIndex]
        if enemy.health > targetHealth then
            target = enemy
            targetHealth = enemy.health
        end
        enemyIndex = enemyIndex + 1
    end
    return target
end

local function valueOverDistance(item)
    return item.value / hero:distanceTo(item)
end

-- Return the item with the highest valueOverDistance(item)
local function findBestItem(items)
    local bestItem = nil
    local bestValue = 0
    local itemsIndex = 1
    
    -- Loop over the items array.
    while itemsIndex <= #items do
    -- Find the item with the highest valueOverDistance()
        local item = items[itemsIndex]
        local distance = valueOverDistance(item)
        if item.value > bestValue then
            bestItem = item
            bestValue = valueOverDistance(item)
        end
        itemsIndex = itemsIndex + 1
    end
    return bestItem
end

while true do
    local enemies = hero:findEnemies()
    local enemy = findMostHealth(enemies)
    if enemy and enemy.health > 15 then
        while enemy.health > 0 do
            hero:attack(enemy)
        end
    else 
        local coins = hero:findItems()
        local coin = nil
        coin = findBestItem(coins)
        if coin then
            hero:moveXY(coin.pos.x, coin.pos.y)
        end
    end
end
