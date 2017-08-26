-- Don’t let ogres step into the grove.

local function onSpawn()
    while (true) do
        local scout = pet:findNearestByType("scout")
        local enemy = hero:findNearestEnemy()
        if (scout and pet:isReady("charm")) then
            pet:charm(scout)
        end
        if (enemy) then
            hero:attack(enemy)
        end
    end
end

-- Assign the event handler to the pet's "spawn" event.
pet:on("charm", onSpawn())
