-- Protect the village with fire traps.
-- Mine all passages in four directions.
-- You have 80 seconds before the ogres attack.

-- Build traps on the line y=114 from x=40 to x=112 with step=24.
local function buildNorthLine(startPoint, finishPoint, step)
    local y=114
    for x=startPoint, finishPoint, step do
        hero:buildXY("fire-trap", x, y)
    end
end

-- Build traps on the line x=140 from y=110 to y=38 with step=18.
local function buildEastLine(startPoint, finishPoint, step)
    local x=140
    -- Complete this function:
    for y=startPoint, finishPoint, step do
        hero:buildXY("fire-trap", x, y)
    end
end

-- Build traps on the line y=22 from x=132 to x=32 with step=20.
local function buildSouthLine(startPoint, finishPoint, step)
    local y=22
    -- Complete this function:
    for x=startPoint, finishPoint, step do
        hero:buildXY("fire-trap", x, y)
    end
end

-- Build traps on the line x=20 from y=28 to y=108 with step=16.
local function buildWestLine(startPoint, finishPoint, step)
    local x=20
    -- Complete this function:
    for y=startPoint, finishPoint, step do
        hero:buildXY("fire-trap", x, y)
    end
end

buildNorthLine(40, 112, 24)
buildEastLine(110, 38, -18)
buildSouthLine(132, 32, -20)
buildWestLine(28, 108, 16)
hero:moveXY(40, 94)
