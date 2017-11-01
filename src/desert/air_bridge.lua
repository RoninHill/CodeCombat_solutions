-- Help peasants to escape.

local function onSpawn(e)
    -- We need to save three peasants.
    local remainingPeasants = 3
    while (remainingPeasants > 0) do
        -- Take a good position.
        pet:moveXY(40, 55)
        local peasant = pet:findNearestByType("peasant")
        if (peasant) then
            -- Carry the peasant to the center passage.
            pet:carryUnit(peasant, 40, 34)
            remainingPeasants = remainingPeasants - 1
        end
    end
    -- Next find a weak ogre and carry it to the fire traps:
    while true do
        -- Move pet closer to ogre camp.
        pet:moveXY(40,60)
        local enemy = pet:findNearestByType("munchkin")
        if (enemy) then
            -- Carry ogre to fire traps.
            pet:carryUnit(enemy, 43, 17)
        end
        -- If hero's health is low, move griffin to potions
        if (hero.health <= hero.maxHealth / 2) then
            local item = hero:findNearestItem()
            -- Move pet to potions.
            pet:moveXY(40, 7)
            if (item) then
                -- Carry potion to hero.
                pet:carryUnit(item, hero.pos.x, hero.pos.y)
            end
        end
    end
end

pet:on("spawn", onSpawn)

-- Fight!
while true do
    local enemy = hero:findNearestEnemy()
    if (enemy and hero:distanceTo(enemy) < 10) then
        hero:attack(enemy)
    end
end
