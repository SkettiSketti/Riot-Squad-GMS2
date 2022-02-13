var onTheGround = place_meeting(x,y + 1, oWall);
dead = (hp <= 0)

if (hurt && onTheGround)
{
	velY = -velY;
	velY -= 1;
}


//applyGravity(object_index,onTheGround,velY,grav) 

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

//Do weapon moving
if (instance_exists(weapon))
{
	
	if (weapon.image_index < 1)
	{
		weapon.x = x + (16 - 0.2) * - image_xscale;
		weapon.y = y
		weapon.image_xscale = image_xscale;
	}
	else if (weapon.image_index < 2)
	{
		weapon.x = x - (16 + 0.2) * - image_xscale
		weapon.y = y
		weapon.image_xscale = image_xscale;
	}
}

if (dead)
{
	image_alpha = 0.5;
}