-- Catch up to Pender Spellbane to learn her secrets.

while true do
    -- Pender is the only friend here, so she's always the nearest.
    local pender = self:findNearest(self:findFriends())

    if pender then
        -- move() only moves one step at a time,
        -- so you can use it to track your target.
        self:move(pender.pos)
    end
end
