-- You must to find the treasure.
-- Use Thoktar's name as a hint.
-- The correct chest is the same index as "z".


-- This function should return the index of a letter:
function hero.letterIndex(word, letter) 
    -- Step through each letter as an index of the word.
    for i=0, string.len(word) do
        -- Store a character from the word with the current index.
        local character = word[i]
        -- If it is the required letter:
        if character == letter then
            return i
        end
    end
    -- If nothing, return a default value
    return -1
end

local ogreLetter = "z"
local shaman = hero:findByType("thoktar")[1]
-- Find the index and use it for finding the treasure.
local chestIndex = hero.letterIndex(shaman.id, "z")
hero:moveXY(16 + (chestIndex-1) * 8, 36)
