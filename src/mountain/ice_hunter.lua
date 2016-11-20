-- Hunt for 4 yaks. Choose only the small ones.
-- Small yak names contain a "bos" substring.

-- This function checks if a word contains a substring.
-- This is a naive, or brute-force, or "directly-head-on" algorithm.
local isSubstring = function(word, substring)
    -- We iterate through the start indexes only.
    local rightEdge = string.len(word) - string.len(substring)
    -- Loop through the indexes of the word.
    for i=1, rightEdge + 1, 1 do
        -- For each of them loop through the substring
        for j=1, string.len(substring), 1 do
            -- Use an offset for the word's indexes.
            local shiftedIndex = i + j
            -- If letters aren't the same:
            if word[shiftedIndex] ~= substring[j] then
                -- Check the next start index in the word.
                break
            end
            -- If it was the last letter in the substring:
            if j == string.len(substring) - 1 then
                -- Then the substring is in the word.
                return true
            end
        end
    end
    -- We haven't found the substring in the word.
    return false
end

-- Loop through all enemies.
local enemies = hero:findEnemies()
for e=1, string.len(enemies), 1 do
    local enemy = enemies[e]
    -- Use the function isSubstring to check
    -- if an enemy name (id) contains "bos":
    if isSubstring(enemy.id, "bos") then
        -- Then defeat it.
        while enemy.health > 0 do
            hero:attack(enemy)
        end
    end
end
