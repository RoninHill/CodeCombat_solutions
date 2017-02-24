-- Get the hero and the peasant to the south.

-- The function move your hero down along the center line.
local function moveDownCenter()
    local x = 40
    local y = hero.pos.y - 12
    hero:moveXY(x, y)
end

-- The function build a fence on the right of something.
local function buildRightOf(something)
    -- buildXY a "fence" 20 meters to something's right.
    local x = something.pos.x
    local y = something.pos.y
    hero:buildXY("fence", x + 20, y)
end

-- The function build a fence on the left of something.
local function buildLeftOf(something)
    -- buildXY a "fence" 20 meters to something's left.
    local x = something.pos.x
    local y = something.pos.y
    hero:buildXY("fence", x - 20, y)
end

while (true) do
    local ogre = hero:findNearestEnemy()
    local coin = hero:findNearestItem()
    if (ogre) then
        buildLeftOf(ogre)
    end
    if (coin) then
        buildRightOf(coin)
    end
    moveDownCenter()
end
