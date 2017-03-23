-- Escape to the right side of the valley.

-- The function moves the hero to down and right.
local function moveDownRight(shift)
    hero:moveXY(hero.pos.x + shift, hero.pos.y - shift)
end

-- The function moves the hero to up and right.
local function moveUpRight(shift)
    -- Complete this function:
    hero:moveXY(hero.pos.x + shift, hero.pos.y + shift)
end


-- The hunter is kind and will show the route.
local hunter = hero:findFriends()[1] -- Remember, Lua starts at 1, not 0.
local route = hunter.route
local routeIndex = 1
local shift = 8

while (routeIndex < route.length) do
    local direction = route[routeIndex]
    if (direction > 1) then
        moveUpRight(shift)
    else
        -- Use a function moveDownRight with the shift 8:
        moveDownRight(shift)
    end
    routeIndex = routeIndex + 1
end
