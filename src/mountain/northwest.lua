-- Your pet should find and then bring the potion to the hero.

-- This new method checks if the word is in the text.
pet.wordInText = function(self, text, word)
    -- Iterate through each character in the text.
    for i=1, string.len(text) - string.len(word) + 1, 1 do
        -- For each of them loop through each character in word.
        for j=1, #word + 1, 1 do
            -- Store the shifted index i + j.
            local shiftedIndex = i + j
            -- If a character within the shifted index.
            -- isn't equal to the character in word at the index "j"
            if text[shiftedIndex] ~= word[j] then
                -- Break the loop.
                break
            end
            -- If j is equal to the index of the last letter in word
            if j == string.len(word) then
                -- Then the entire word is in the text.
                -- Return True.
                return true
            end
        end 
    end
    -- The word was not found in text. Return false.
    return false
end

-- Follow the guides directions where to run.
local onHear = function(event)
    
    -- If "west" is in the phrase, the pet should run left.
    if pet:wordInText(event.message, "west") then
        pet:moveXY(pet.pos.x - 28, pet.pos.y)
    -- If "north" is in the phrase, the pet should run up.
    elseif pet:wordInText(event.message, "north") then
        pet:moveXY(pet.pos.x, pet.pos.y + 24)
    -- Else the pet should try to fetch the potion.
    else
        local potion = pet:findNearestByType("potion")
        if potion then
            pet:fetch(potion)
        end
    end
end

pet:on("hear", onHear)
