-- You need to find and destroy 3 skeletons.
-- Skeletons and items are summoned at points of power.
-- Move to a point and say the spell: "VENI".
-- To find the required points, use the wizard's map.
-- 0s are bad points. Positive numbers are good.

local spell = "VENI";
-- The map of points is a 2D array of numbers.
local wizard = hero:findNearest(hero:findFriends())
local powerMap = wizard.powerMap

-- This function converts grid into x-y coordinates.
local function convert(row, col)
    return {"x"= 16 + col * 12, "y"= 16 + row * 12}
end

-- Loop through the powerMap to find positive numbers.
-- First, loop through indexes of rows.
for i=1, #powerMap do
    -- Each row is an array. Iterate through it.
    for j=1, #powerMap[i] do
        -- Get the value of the i row and j column.
        local pointValue = powerMap[i][j]
        -- If it's a positive number:
        if pointValue > 0 then
            -- Use convert to get XY coordinates.
            local loc = convert(i,j)
            -- Move there, say "VENI" and be prepared!
            self:moveXY(loc['x'], loc['y'])
            self:say(spell)
        end
    end
end
