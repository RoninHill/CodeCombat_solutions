-- Ogres are hiding in woods. Protect the peasants.
-- The last word in the peasants' messages are a hint.

-- We define the split function
string.split = function(text, token) 
    local words = {}
    local wordStart = 1
    local wordIndex = 1
    for i=1, string.len(text), 1 do
        if text[i] == token then
            words[wordIndex] = string.sub(text, wordStart, i -1)
            wordStart = i + 1
            wordIndex = wordIndex + 1
        end
    end
    words[wordIndex] = string.sub(text, wordStart)

    return words
end

for x=8, 72, 16 do
    hero:moveXY(x, 22)
    -- Peasants know whom to summon.
    local peasant = hero:findNearest(hero:findFriends())
    local message = peasant.message
    if message then
        -- Words are seaparated by whitespaces.
        local words = string.split(message, " ")
        -- "words" is an array of words from the "message".
        -- Get the last word. It's the required unit type.
        local unit = words[#words]
        -- Summon the required unit type.
        hero:summon(unit)
    end
end

for i=1, #hero.built, 1 do
    local unit = hero.built[i]
    -- Command the unit to defend the unit's position.
    hero:command(unit, "defend", { x=unit.pos.x, y=unit.pos.y })
end

-- Defend the last point yourself:
hero:moveXY(72, 22)
while true do
    local enemy = hero:findNearestEnemy()
    if enemy and hero:distanceTo(enemy) < 5 then
        hero:attack(enemy)
    end
end    
