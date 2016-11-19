-- Command your troops to move east and attack any ogres they see.
-- Use for-loops and findFriends.
-- You can use findNearestEnemy() on your soldiers to get their nearest enemy instead of yours.
-- NOTE: This code may be SLOW when run, because of the loop-within-a-loop solution in the code,
-- causing an O(n^2) runtime.
while true do
    local friends = hero:findFriends()
    for i=1,#friends do
        local friend = friends[i]
        local enemy = friend:findNearest(friend:findEnemies())
        if friend.pos.y > 56 then
            if friend.type == "archer" then
                hero:command(friend, "move", { x=46, y=friend.pos.y })
            else
                hero:command(friend, "move", { x=54, y=friend.pos.y })
            end
            if enemy then
                hero:command(friend, "attack", enemy)
            end
        elseif friend.pos.y > 38 and friend.pos.y < 56 then
            if friend.type == "archer" then
                hero:command(friend, "move", { x=64, y=friend.pos.y })
            else
                hero:command(friend, "move", { x=72, y=friend.pos.y })
            end
            if enemy then
                hero:command(friend, "attack", enemy)
            end
        else
            if friend.type == "archer" then
                hero:command(friend, "move", { x=52, y=friend.pos.y })
            else
                hero:command(friend, "move", { x=60, y=friend.pos.y })
            end
            if enemy then
                hero:command(friend, "attack", enemy)
            end
        end
    end
end
