-- Move the hero and their pet to the exits.

-- Returns an array of words from the string
string.split = function(text, token) 
    local words = {}
    local wordStart = 1
    local wordIndex = 1
    for i=1, string.len(text), 1 do
        if event.message[i] == token then
            words[wordIndex] = string.sub(event.message, wordStart, i -1)
            wordStart = i + 1
            wordIndex = wordIndex + 1
        end
    end
    words[wordIndex] = string.sub(event.message, wordStart)

    return words
end

local onHear = function(event)
    -- Get the volume and the password.
    local words = string.split(event.message, " ")
    local volume = words[1]
    local password = words[2]
    --  If the password should be loud:
    if volume == "Loud" then
        -- The pet repeats it in UPPER CASE.
        pet:say(string.upper(words[2]))
    end
    -- If the password should be quiet:
    if volume == "Quiet" then
        -- The pet repeats it in lower case.
        pet:say(string.lower(words[2]))
    end
    pet:moveXY(pet.pos.x+ 24, pet.pos.y)

end

local passDoor = function()
    local guard = hero:findNearest(hero:findFriends())
    local password = guard.password
    --  If the password should be loud:
    if guard.isLoud then
        -- Use the .toUpperCase() method on the password. 
        -- Lua's version uses string.upper().
        hero:say(string.upper(password))
    -- If the password should be quiet:
    elseif guard.isQuiet then
        -- Use the .toLowerCase() method on the password.
        -- Lua's version uses string.lower().
        hero:say(string.lower(password))
    end
    hero:moveXY(hero.pos.x+ 24, hero.pos.y)
end

-- Enable the pet to hear the guards.
pet:on("hear", onHear)
-- The code for the hero to pass the doors.
hero:moveXY(10, 14)
passDoor()
passDoor()
