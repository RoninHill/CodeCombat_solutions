-- This is an array of nearby names!
-- Enemies are at the 1, 3, 5, and 7 indexes of the array.
local names = {
    "Thabt", "Victor", -- 1, 2
    "Leerer", "Alianor", -- 3, 4
    "Gorylo", "Millicent", -- 5, 6
    "Weeb", "Brom" -- 7, 8
}

-- Attack the first two ogres at indexes 1 and 5.
hero:attack(names[1])
hero:attack(names[5])
-- Attack the ogre at index 3:
hero:attack(names[3])
-- Attack the ogre at index 7:
hero:attack(names[7])
