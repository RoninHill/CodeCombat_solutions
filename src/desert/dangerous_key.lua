-- Listen to the paladin and fetch the right key.

local onHear = function(event)
    -- The pet can find the paladin and keys.
    local paladin = pet:findNearestByType("paladin")
    local goldKey = pet:findNearestByType("gold-key")
    local silverKey = pet:findNearestByType("silver-key")
    local bronzeKey = pet:findNearestByType("bronze-key")
    -- If event.speaker is the paladin:
    if event.speaker == paladin then
        -- If event.message is "Gold":
        if event.message == "Gold" then
            -- The pet should fetch the gold key.
            pet:fetch(goldKey)
        end
        -- If event.message is "Silver":
        if event.message == "Silver" then
            -- The pet should fetch the silver key.
            pet:fetch(silverKey)
        end
        -- If event.message is "Bronze":
        if event.message == "Bronze" then
            -- The pet should fetch the bronze key.
            pet:fetch(bronzeKey)
        end
    end
end

pet:on("hear", onHear)
