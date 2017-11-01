// Figure out which direction the ogres are coming from.

while (true) {
    var enemy = hero.findNearestEnemy();
    if (enemy) {
        // Left: enemy.pos.x is less than hero.pos.x
        var isLeft = hero.pos.x  > enemy.pos.x;
        // Above: enemy.pos.y is greater than hero.pos.y
        var isAbove = hero.pos.y < enemy.pos.y;
        // Right: enemy.pos.x is greater than hero.pos.x
        var isRight = hero.pos.x < enemy.pos.x;
        // Below: enemy.pos.y is less than hero.pos.y
        var isBelow = hero.pos.y > enemy.pos.y;
        // If enemy isAbove and isLeft:
        // buildXY() a "fire-trap" at the X mark.
        if (isLeft && isAbove) {
            hero.buildXY("fire-trap", 40 - 20, 34 + 17);
        }
        // If enemy isAbove and isRight:
        // buildXY() a "fire-trap" at the X mark.
        if (isRight && isAbove) {
            hero.buildXY("fire-trap", 40 + 20, 34 + 17);
        }
        // If enemy isBelow and isLeft:
        // buildXY() a "fire-trap" at the X mark.
        if (isLeft && isBelow) {
            hero.buildXY("fire-trap", 40 - 20, 34 - 17);
        }
        // If enemy isBelow and isRight:
        // buildXY() a "fire-trap" at the X mark.
        if (isRight && isBelow) {
            hero.buildXY("fire-trap", 40 + 20, 34 - 17);
        }
        hero.moveXY(40, 34);
    } else {
        hero.moveXY(40, 34);
    }
}
