-- Defeat all incoming ogres.

while true do
    -- Find the nearest enemy.
    local enemy = hero:findNearestEnemy()
    -- If there is an enemy, and it is a "brawler":
    if enemy then
        if enemy.type == "brawler" then
            -- Then say its name (.id) in UPPERCASE.
            local shout = string.upper(enemy.id)
            hero:say(shout)
        -- For other enemies, just fight.
        else
            hero:attack(enemy)
        end
    end
end
