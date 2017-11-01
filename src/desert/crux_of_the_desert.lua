-- Figure out which direction the ogres are coming from.

while true do
    local enemy = hero:findNearestEnemy()
    if enemy then
        -- Left: enemy.pos.x is less than hero.pos.x
        local isLeft = hero.pos.x  > enemy.pos.x
        -- Above: enemy.pos.y is greater than hero.pos.y
        local isAbove = hero.pos.y < enemy.pos.y
        -- Right: enemy.pos.x is greater than hero.pos.x
        local isRight = hero.pos.x < enemy.pos.x
        -- Below: enemy.pos.y is less than hero.pos.y
        local isBelow = hero.pos.y > enemy.pos.y;
        -- If enemy isAbove and isLeft:
        -- buildXY() a "fire-trap" at the X mark.
        if (isLeft and isAbove) then
            hero:buildXY("fire-trap", 40 - 20, 34 + 17)
        end
        -- If enemy isAbove and isRight:
        -- buildXY() a "fire-trap" at the X mark.
        if (isRight and isAbove) then
            hero:buildXY("fire-trap", 40 + 20, 34 + 17)
        end
        -- If enemy isBelow and isLeft:
        -- buildXY() a "fire-trap" at the X mark.
        if (isLeft and isBelow) then
            hero:buildXY("fire-trap", 40 - 20, 34 - 17)
        end
        -- If enemy isBelow and isRight:
        -- buildXY() a "fire-trap" at the X mark.
        if (isRight and isBelow) then
            hero:buildXY("fire-trap", 40 + 20, 34 - 17)
        end
        hero:moveXY(40, 34)
    else
        hero:moveXY(40, 34)
    end
end
