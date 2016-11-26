-- The treasure somewhere between trees.
-- The coordinates are 'x: ?0, y: ?0'. 
-- Move at all potential points and show to peasants where to dig.

local leftBorder = 20
local rightBorder = 60
local bottomBorder = 20
local topBorder = 50
local step = 10

-- Iterate X coordinates from the left to right border with step 10.
for x=leftBorder, rightBorder, step do
    -- Use a nested loop to iterate through Y coordinates for each X.
    -- Iterate y coordinates from the bottom to top border with step 10.
    for y=bottomBorder, topBorder, step do
        -- Move to the point with coordinates X, Y and say anything.
        hero:moveXY(x, y)
        hero:say("Here")
    end
end

-- Allow peasants to check the last point.
hero:moveXY(20, 10)
