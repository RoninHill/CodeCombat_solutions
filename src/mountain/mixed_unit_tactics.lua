-- Practice using modulo to loop over an array

-- Choose the mix and order of units you want to summon by populating this array:
local summonTypes = {}
summonTypes[1] = "soldier"
-- Fill in the rest of the summon types with your mix of units!
summonTypes[2] = "archer"
summonTypes[3] = "archer"
summonTypes[4] = "soldier"
summonTypes[5] = "soldier"
summonTypes[6] = "soldier"
summonTypes[7] = "archer"
summonTypes[8] = "archer"
summonTypes[9] = "soldier"
summonTypes[10] = "soldier"
summonTypes[11] = "archer"
summonTypes[12] = "archer"

local locations = {{"x"=39, "y"=44}, 
                    {"x"=39, "y"=39},
                    {"x"=39, "y"=34},
                    {"x"=39, "y"=30},
                    {"x"=39, "y"=25},
                    {"x"=37, "y"=28},
                    {"x"=37, "y"=31},
                    {"x"=36, "y"=34},
                    {"x"=37, "y"=40},
                    {"x"=37, "y"=43}}

local function summonTroops()
    -- Use % to wrap around the summonTypes array based on #self.built
    ---local type = summonTypes[???]
    local thetype = summonTypes[#self.built % #summonTypes + 1]
    if self.gold > self:costOf(thetype) then
        self:summon(thetype)
    end
end

local function commandTroops()
    -- Command troops to attack nearest enemy
    local palisades = self:findByType("palisade")
    local archers = self:findByType("archer")
    local soldiers = self:findByType("soldier")
    local enemy = self:findNearest(self:findEnemies())
    for i, archer in pairs(archers) do
        local location = locations[i % #locations]
        if enemy then
            self:command(archer, "attack", enemy)
        else
            self:command(archer, "move", location)
        end
    end
    for j, soldier in pairs(soldiers) do
        local location = locations[j % #locations]
        if enemy then
            self:command(soldier, "attack", enemy)
        else
            self:command(soldier, "move", location)
        end
    end
end

local function collectCoins()
    -- Get the coin nearest to the player
    local item = self:findNearest(self:findItems())
    if item then
        self:move(item.pos)
    end
end

loop
    summonTroops()
    commandTroops()
    collectCoins()
end
