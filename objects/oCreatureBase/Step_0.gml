var onTheGround = place_meeting(x,y + 1, oWall);
dead = (hp <= 0)

if (x < 0)
{
	x = 0
	velX = -velX;
}
else if (x > 1364)
{
	x = 1364
	velX = -velX;
}



//applyGravity(object_index,onTheGround,velY,grav) 

if (!onTheGround)
{
	//apply gravity
	velY += grav;
}
else 
{
	
	while place_meeting(x,y,oWall) 
		y -= 1;
	
	//Bounce off ground
	if ((dead || hurt) && onTheGround && velY > 1)
	{
		y -= 1;
		velY = -velY/2;
	}
	else//Just stick to ground
	{
		velY = 0;
	}

	
}



x += velX;

y += velY;


//Limit speed
if (abs(velX) > maxSpd)
velX = sign(velX) * maxSpd;

//Limit speed
if (abs(velY) > maxSpd)
velY = sign(velY) * maxSpd;


if (onTheGround)
{
	velX += -velX * fric;
}
else 
{
	//less friction when in the air
	velX += -velX * fric/1.25;
}
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