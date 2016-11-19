-- The inner gate can hold for a long time.
-- However, one of these peasants is an OGRE SPY!
-- There is a hint! The spy's name has the letter "z"

-- This function checks for a specific letter in a word.
-- A string is just an array! Loop over it like an array
local function letterInWord(word, letter)
    for i=1, #word do
        local character = word[i]
        -- If character is equal to letter, return true
        if character == letter then
            return true
        end
    end

    -- The letter isn't in the word, so return false
    return false
end

local spyLetter = "z"
local friends = hero:findFriends()

for j=1, #friends do
    local friendName = friends[j].id
    if letterInWord(friendName, spyLetter) then
        -- Reveal the spy!
        hero:say(friendName + " is a spy!")
    else
        hero:say(friendName + " is a friend.")
    end
end
