-- NOTE: This code will be VERY SLOW when run.
while true do
    -- Collect gold.
    local coin = self:findNearestItem()
    self:move(coin.pos)
    
    -- If you have enough gold, summon a soldier.
    if self.gold > self:costOf("soldier") then
        self:summon("soldier")
    end
    -- Use a for-loop to command each soldier.
    local friends = self:findFriends()
    -- Simple for-loops have three parts: for <counter>=<start>,<end> do
    -- The <counter> is the variable that will hold the index number.
    -- It will hold the <start> value at first (here 1).
    -- It will count up to <end> (#friends is the length of the friends array).
    for friendIndex = 1, #friends do
        local friend = friends[friendIndex]
        if friend.type == "soldier" then
            local enemy = friend:findNearestEnemy()
            -- If there's an enemy, command her to attack.
            -- Otherwise, move her to the right side of the map.
            if enemy then
                self:command(friend, "attack", enemy)
            else
                self:command(friend, "move", { x=80, y=45 })
            end
        end
    end
end
