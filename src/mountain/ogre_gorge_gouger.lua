-- You only have 20 seconds until the ogre horde arrives!
-- Grab as much gold as you can, then retreat to your base and wall it off!
while self:now() < 20 do
    -- Collect coins
    local coin = self:findNearestItem()
    if self:isReady("dash") then
        self:dash(coin)
    end
    self:move(coin.pos)
end
while self.pos.x > 16 do
    -- Retreat behind the fence
    self:moveXY(16, 38)
end
-- Build a fence to keep the ogres out.
self:buildXY("fence", 21, 36)
