-- Protect the village from the ogres. 
-- Watch for ogres, peasants and ogres disguised as ”peasants".

-- This function checks if the text starts with the word.
local startsWith = function(text, word)
    -- If the word is longer then the text:
    if string.len(word) > string.len(text) then
        return false
    end
    -- Loop through the indexes of word and text.
    for index=1, string.len(word), 1 do
        -- If characters with the same index are different:
        if word[index] ~= text[index] then
            -- Then the word doesn't coincide with the text.
            return false
        end
    -- We checked all letters and they are the same.
    end
    return true
end

local ogreNameStart = "Zog"

while true do
    local enemy = hero:findNearestEnemy()
    local suspect = hero:findNearest(hero:findFriends())
    -- Use the function "startsWith" to check
    -- if suspect's name (id) starts with "Zog", attack:
    if startsWith(suspect.id, ogreNameStart) then
        hero:attack(suspect)
    -- Else if there is an enemy, then attack it:
    elseif enemy then
        hero:attack(enemy)
    -- Else return to the red X mark:
    else
        hero:moveXY(27, 27)
    end
end
