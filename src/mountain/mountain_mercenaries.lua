-- Gather coins to summon soldiers and have them attack the enemy.
-- NOTE: This code, when run, will be very slow because of the data that will be produced
-- along with the loop-within-a-loop structure of the code, running in O(n^2) time.
while true do
    -- Move to the nearest coin.
    -- Use move instead of moveXY so you can command constantly.
    local coin = self:findNearest(self:findItems())
    self:move(coin.pos)
    
    -- If you have funds for a soldier, summon one.
    if self.gold > self:costOf("soldier") then
        self:summon("soldier")
    end
    
    local enemy = self:findNearest(self:findEnemies())
    if enemy then
        -- Loop over all your soldiers and order them to attack.
        local soldiers = self:findFriends()
        local soldierIndex = 1
        -- Use the 'attack' command to make your soldiers attack.
        while soldierIndex <= #soldiers do
            local soldier = soldiers[soldierIndex]
            self:command(soldier, "attack", enemy)
            soldierIndex = soldierIndex + 1
        end
    end
end
