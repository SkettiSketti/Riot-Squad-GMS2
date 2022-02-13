event_inherited()
var hurtValue = irandom_range(minDmg,maxDmg);
//Decrease Health 
other.hp -= hurtValue

//knock back no matter what
other.y -= 1;
other.velX = other.velX + image_xscale * knockbackX;
other.velY = -knockbackY;
