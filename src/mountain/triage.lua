-- Triage the wounded soldiers.

local doctor = hero:findByType("paladin")[1]
local mage = hero:findByType("pixie")[1]
local helper = hero:findByType("peasant")[1]
local soldiers = hero:findByType("soldier")

-- Initialize patient arrays.
local doctorPatients = {}
local magePatients = {}
local helperPatients = {}

local mageIndex = 1
local doctorIndex = 1
local helperIndex = 1
-- Iterate all the soldiers:
for i=1, #soldiers, 1 do
    local soldier = soldiers[i]
    -- If soldier is slowed:
    if soldier.maxSpeed < 6 then
        -- Add them to the mage's array of patients.
        magePatients[mageIndex] = soldier
        mageIndex = mageIndex + 1
    -- Else if soldier.health is less than half of maxHealth:
    elseif soldier.health < soldier.maxHealth / 2 then
        -- Add them to the doctor's array of patients.
        doctorPatients[doctorIndex] = soldier
        doctorIndex = doctorIndex + 1
    -- Else:
    else
        -- Add soldier to the helper's array of patients.
        helperPatients[helperIndex] = soldier
        helperIndex = helperIndex + 1
    end      
end
-- Now assign the patient lists to the appropriate person.
mage.patients = magePatients
doctor.patients = doctorPatients
helper.patients = helperPatients
