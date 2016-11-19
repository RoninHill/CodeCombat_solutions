-- The raven will tell you what to use for your maze parameters!
local SLIDE = 10
local SWITCH = 7
local SKIP = 11

-- Set up boolean variables switch and skip to toggle conditions.
local switch = false
local skip = false

-- How many sideSteps north of the Red X you've taken.
local sideSteps = 1

-- How many steps east of the Red X you've taken.
local steps = 1

-- Multiply this with steps to determine your X coordinate. DON'T CHANGE THIS!
local X_PACE_LENGTH = 4

-- Multiply this with sideSteps to determine your Y coordinate. DON'T CHANGE THIS!
local Y_PACE_LENGTH = 6

-- The maze is 35 steps along the X axis.
while steps <= 35 do
    -- Take the next step:
    self:moveXY(steps * X_PACE_LENGTH, sideSteps * Y_PACE_LENGTH)
    
    -- Increment steps and sideSteps as appropriate, taking into account the special rules.
    steps = steps + 1
    
    -- Toggle switching and skipping of sideSteps.
    if not switch then
        if not skip then
            sideSteps = sideSteps + 1
        else
            sideSteps = sideSteps + 2
            skip = not skip -- Turn off skip if skip is on.
        end
    elseif switch then
        if not skip then
            sideSteps = sideSteps - 1
        else
            sideSteps = sideSteps - 2
            skip = not skip
        end
    end

    -- Make the conditions for SWITCH and SKIPping here.
    -- If steps are divisible by the SWITCH, then sideStep in oppo direction.
    -- If steps are divisible by the SKIP, then sideStep twice.
    if steps % SWITCH == 0 then
        switch = not switch
    elseif steps % SKIP == 0 then
        skip = not skip
    end
    
    -- Make cases for any sideSteps taken.
    -- If sideSteps are over SLIDE, then wrap back to 1. For sideSteps below 1, go back to SLIDE.
    if sideSteps > SLIDE then
        sideSteps = 1
    elseif sideSteps < 1 then
        sideSteps = SLIDE
    end
end
