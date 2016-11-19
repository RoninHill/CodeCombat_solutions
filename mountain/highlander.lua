-- You must defeat the ogres
-- But they are using black magic!
-- Only the highlander soldiers are immune.
-- Find highlanders, their names always contain "mac"

local highlanderName = "mac"

-- This function should search for a string inside of a word:
local function wordInString(str, word)
    local lenString = #str
    local lenWord = #word
    local lenDifference = lenString - lenWord
    -- Step through indexes (i) from 0 to (lenString - lenWord)
    for i=0, lenDifference do
        -- For each of them through indexes (j) of the word length
        for j=1, lenWord do
            -- If [i + j]th letter of the string is not equal [j]th letter of word, then break loop
            if str[i + j] ~= word[j] then
                break
            end
            -- if [j]th letter is the last letter of the word (j == lenWord - 1), then return True.
            if j == string.len(word) then
                return true
            end
        end
    end
    -- If loops are ended then the word is not inside the string. Return False.
    return false
end

-- Look at your soldiers and choose highlanders only
local soldiers = hero:findFriends()
for i=1, #soldiers do
    local soldier = soldiers[i]
    if (wordInString(soldier.id, highlanderName)) then
        hero:say(soldier.id + " be ready.")
    end
end

-- Attack 
hero:say("ATTACK!!!”)
