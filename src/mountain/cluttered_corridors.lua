-- Help the pet find the exit.

local onHear = function(event)
    local word = event.message
    -- Convert the word to lower case.
    word = string.lower(word)
    if word == "north" then
        pet:moveXY(pet.pos.x, pet.pos.y + 16)
    elseif word == "east" then
        pet:moveXY(pet.pos.x + 12, pet.pos.y)
    elseif word == "south" then
        pet:moveXY(pet.pos.x, pet.pos.y - 16)
    elseif word == "west" then
        pet:moveXY(pet.pos.x - 12, pet.pos.y)
    end
    
end

-- Assign the event handler for the pet's "hear" event.
pet:on("hear", onHear)
