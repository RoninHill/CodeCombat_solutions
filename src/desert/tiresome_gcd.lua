-- Calculate the secret number and get into the Treasury.
-- Those two guys know keys for the password.
local friends = hero:findFriends()
local number1 = friends[1].secretNumber
local number2 = friends[2].secretNumber
-- Just to be sure that the first number is greater.
if (number2 > number1) then
    local swap = number1
    number1 = number2
    number2 = swap
end

-- It's simple but slow function to find gcd.
local function bruteforceGCD (a, b)
    hero:say("The naive algorithm.")
    local cycles = 0
    -- We enumerate all possible divisors.
    local counter = b
    while (true) do
        cycles = cycles + 1
        if (cycles > 100) then
            hero:say("Calculating is hard. I'm tired.")
            break
        end
        -- If both number have "counter" divisor.
        if (a % counter == 0 and b % counter == 0) then
            break
        end
        counter = counter - 1
    end
    hero:say("I used " + cycles + " cycles")
    return counter
end

-- It's smart way to find gcd.
local function euclidianGCD (a, b)
    local cycles = 0
    while (b) do
        cycles = cycles + 1
        local swap = b
        b = a % b
        a = swap
    end
    hero:say("I used " + cycles + " cycles")
    return a
end

-- Δ Maybe you need to use another function?
local secretNumber = euclidianGCD(number1, number2)
hero:moveXY(48, 34)
hero:say(secretNumber)
-- The treasury is open (I hope so)! Go there!
hero:moveXY(68, 34)
