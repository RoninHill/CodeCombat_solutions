-- Ogres are going to attack soon.
-- Move near each of tents (to the X marks)
-- say() something at each X to wake your soldiers.
-- Beware: leave the camp when the battle begins!
-- Ogres will send reinforcements if they see the hero.

-- The sergeant knows the distance between tents.
local sergeant =  hero:findNearest(hero:findFriends())

-- The distances between the X marks.
local stepX = sergeant.tentDistanceX
local stepY = sergeant.tentDistanceY
-- The number of tents.
local tentsInRow = 5
local tentsInColumn = 4

-- The first tent mark has constant coordinates.
local firstX = 10
local firstY = 14

-- Use nested loops and visit all 20 tents.
-- IMPORTANT: move row by row - it's faster.
local cx = stepX * tentsInColumn + firstX
local cy = stepY * (tentsInRow - 2) + firstY 

for row=firstY, cy, stepY do
    for col=firstX, cx, stepX do
        hero:moveXY(col, row)
        hero:say("Wake up!")
    end
end
-- Now watch the battle.
hero:moveXY(72, 48)
