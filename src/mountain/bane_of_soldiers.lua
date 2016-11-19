-- Robobombs explode when they are destroyed or touch an enemy.
-- Split up your soldiers so that they don't all get exploded together.
-- Assign a different array of positions to run away to.
local pts = {}
pts[1] = { x=60, y=60 }
pts[2] = { x=8, y=16 }
pts[3] = { x=12, y=32 }
pts[4] = { x=64, y=10 }

while true do
    local enemies = hero:findEnemies()
    local enemy = hero:findNearest(enemies)
    local friends = hero:findFriends()
    -- Send the first four soldiers of the friends array towards the enemy.
    hero:command(friends[1], "attack", enemy)
    hero:command(friends[2], "move", { x=64, y=50 })
    hero:command(friends[3], "move", pts[1])
    hero:command(friends[4], "move", pts[4])
    -- i = 5 starts the index at the fifth element in Lua!
   for i=5,#friends do
        local friend = friends[i];
        -- Command the remaining soldiers to run away!
        if friend.pos.y > 60 then
            hero:command(friend, "move", pts[2])
        else
            hero:command(friend, "move", pts[3])
        end
    end
end
