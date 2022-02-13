var onTheGround = place_meeting(x,y + 1, oWall);
var xDir = keyboard_check(ord("D")) - keyboard_check(ord("A")) 

//Move guy
if (xDir != 0) 
{
	image_xscale = xDir;
	velX += image_xscale * spd;
}


if (!onTheGround)
{
	//apply gravity
	velY += grav;
}
else 
{
	while place_meeting(x,y,oWall) y -= 1;
	velY = 0;
}



x += velX;

y += velY;

//Limit speed
if (abs(velX) > maxSpd)
velX = sign(velX) * maxSpd;

//Limit speed
if (abs(velY) > maxSpd)
velY = sign(velY) * maxSpd;



velX += -velX * fric;


//Threshold for when the player should just not move
if (abs(velX) < 0.01)
	velX = 0;


if (hurt)
{
	sprite_index = sBugHurt;
}
else 
{
	sprite_index = sBugIdle;
}