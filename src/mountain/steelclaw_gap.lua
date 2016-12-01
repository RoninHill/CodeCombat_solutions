-- This level introduces the % operator, also known as the modulo operator.
-- a % b returns the remainder of a divided by b
-- This can be used to wrap around to the beginning of an array when an index might be greater than the length

local defendPoints = {{"x"=35, "y"=63},{"x"=61, "y"=63},{"x"=32, "y"=26},{"x"=64, "y"=26}}

local summonTypes = {"soldier","soldier","soldier","soldier","archer","archer","archer","archer"}

-- You start with 360 gold to build a mixture of soldiers and archers.
-- self.built is an array of the troops you have built, ever.
-- Here we use "len(self.built) % len(summonTypes)" to wrap around the summonTypes array
local function summonTroops()
	local type = summonTypes[#self.built % #summonTypes + 1]
	if self.gold >= self:costOf(type) then
		self.summon(type)
	end
end

local function commandTroops()
    local friends = self:findFriends()
    for friendIndex=1, #friends do
        local friend = friends[friendIndex]
        -- Use % to wrap around defendPoints based on friendIndex
        local defendPoint = defendPoints[friendIndex % #defendPoints + 1]
        -- Command your minion to defend the defendPoint
        self:command(friend, "defend", defendPoint)
    end
end

loop
    summonTroops()
    commandTroops()
end
