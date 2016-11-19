-- This level is a place for making flower art.
-- The real goal is to experiment and have fun!
-- If you draw something with at least 1000 flowers, you will "succeed" at the level.

-- Draw a Sierpinski triangle, a fractal, or a shape that can be split into smaller versions of itself,
-- that looks like a Triforce.
local function drawTriangle(x1, x2, x3, y1, y2, y3, order)
    if order > 0 then
        self:toggleFlowers(true)
    
        self:moveXY(x1, y1)
        self:moveXY(x2, y2)
        self:moveXY(x3, y3)
        self:moveXY(x1, y1)
    
        local p1 = midpoint(x1, x2, y1, y2)
        local p2 = midpoint(x2, x3, y2, y3)
        local p3 = midpoint(x3, x1, y3, y1)
    
        drawTriangle(x1, p1['x'], p3['x'], y1, p1['y'], p3['y'], order-1)
        drawTriangle(p1['x'], x2, p2['x'], p1['y'], y2, p2['y'], order-1)
        drawTriangle(p3['x'], p2['x'], x3, p3['y'], p2['y'], y3, order-1)
    end
    self:toggleFlowers(false)
end

local function midpoint(x1, x2, y1, y2)
    local p = {}
    local px = ((x1 + x2) / 2)
    local py = ((y1 + y2) / 2)
    p = { x=px, y=py }
    return p
end

local start = { x=86, y=121 }

self:setFlowerColor("random")
self:toggleFlowers(false)
self:moveXY(start['x'], start['y'])
drawTriangle(start['x'], 24, 144, start['y'], 23, 23, 2)
