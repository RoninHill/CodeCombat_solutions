-- Find the password for the gates and defeat the ogres.

-- Returns an array of words from the string
string.split = function(text, separator) 
    local words = {}
    local wordStart = 1
    local wordIndex = 1
    for i=1, string.len(text), 1 do
        if text[i] == separator then
            words[wordIndex] = string.sub(text, wordStart, i -1)
            wordStart = i + 1
            wordIndex = wordIndex + 1
        end
    end
    words[wordIndex] = string.sub(text, wordStart)

    return words
end


-- Get the secret message.
hero:moveXY(52, 50)
local friend = hero:findNearest(hero:findFriends())
local message = friend.message

-- Get the separator symbol.
hero:moveXY(66, 34)
local friend = hero:findNearest(hero:findFriends())
local separator = friend.separator

-- Get the index.
hero:moveXY(52, 18)
local friend = hero:findNearest(hero:findFriends())
local index = friend.index + 1

-- Move to the gates.
hero:moveXY(44, 34)
-- Split the message with the separator to get an array:
local message = string.split(message, separator)
-- Get the password from the array of words by the index:
local password = message[index]
-- Say the password:
hero:say(password)

-- Defeat the ogres:
while true do
    local enemy = hero:findNearestEnemy()
    if enemy then
        hero:attack(enemy)
    end
end
