var onTheGround = place_meeting(x,y + 1, oWall);

//move slower down
if (!onTheGround && !dead)
{
	velY -= grav/3;
	
	var dir;
	if (oPlayer.x > x)
	{
		dir = 1;
	}
	else 
	{
		dir = -1;
	}
	velX += dir * 0.25;
	image_xscale = dir * 1;
}


//Hop to player
if (!hurt && onTheGround && !dead)
{
	var dir;
	var pow = random_range(5,10);
	if (oPlayer.x > x)
	{
		dir = 1;
	}
	else 
	{
		dir = -1;
	}
	velX += dir * pow;
	image_xscale = dir * 1;
		
	//jump
	y -= 1;
	velY -= random_range(2,4);
}


event_inherited();


//Within close proximity
if (abs(oPlayer.x - x) < 16)
{
	/*
	if (canWhip)
	{
		canWhip = false
		weapon = instance_create_layer(x,y,"Instances",oBaton);
	}
	*/
}


//Animate
if (hurt)
{
	sprite_index = sBugHurt;
}
else if (!onTheGround)
{
	sprite_index = sBugJump;
}
else if (abs(velX) > 1)
{
	sprite_index = sBugWalk;
}
else 
{
	sprite_index = sBugIdle;
}

if (dead)
{
	sprite_index = sBugDefeat
}