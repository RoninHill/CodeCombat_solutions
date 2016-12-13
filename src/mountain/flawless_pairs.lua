-- Collect 4 pairs of gems.
-- Each pair must contain equal valued gems.

-- This function returns two items with the same value.
local function findValuePair(items)
    -- Check each possible pair in the array.
    -- Iterate indexes 'i' from 0 to the last one.
    for i=1, #items do
        local itemI = items[i]
        -- Iterate indexes 'j' from 0 to the last.
        for j=1, #items do
            -- If it's the same element, then skip it.
            if (i == j) then
                j = j + 1
            end
            local itemJ = items[j]
            -- If we found a pair with two equal gems, then return them.
            if (itemI.value == itemJ.value) then
                return {itemI, itemJ}
            end
        end
    end
    -- Return an empty array if no pair exists.
    return nil
end

while true do
    local gems = hero:findItems()
    local gemPair = findValuePair(gems)
    -- If the gemPair exists, collect the gems!
    if gemPair then
        -- Remember, lua starts at 1, not 0!
        local gemA = gemPair[1]
        local gemB = gemPair[2]
        local hasteX = 40
        local hasteY = 44
        -- Move to the first gem.
        hero:moveXY(gemA.pos.x, gemA.pos.y)
        -- Return to get the haste from the wizard.
        hero:moveXY(hasteX, hasteY)
        -- Then move to the second gem.
        hero:moveXY(gemB.pos.x, gemB.pos.y)
        -- Return to get the haste from the wizard.
        hero:moveXY(hasteX, hasteY)
    end
end
