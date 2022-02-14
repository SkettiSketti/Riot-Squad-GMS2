var onTheGround = place_meeting(x,y + 1, oWall);

//move slower down
if (!onTheGround && !dead && !hurt)
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
	//velX += dir * 0.25;
	//image_xscale = dir * 1;
}

/*
//Run towards player
if (!hurt && onTheGround && !dead)
{
	var dir;
	if (oPlayer.x > x)
	{
		dir = 1;
	}
	else 
	{
		dir = -1;
	}
	velX += dir * spd;
	image_xscale = dir * 1;
	
	
}
*/


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
	image_xscale = sign(velX) * 1;
		
	//jump
	y -= 1;
	velY -= random_range(3,4);
}


event_inherited();

var attackRange = 32; //higher = more lenient
//Within close proximity
if (abs(oPlayer.x - x) < attackRange)
{

	if (canWhip && !dead && !hurt)
	{
		
		canWhip = false
		sprite_index = sBugWhip;
		if (!instance_exists(weapon))
		{
			weapon = instance_create_layer(x,y,"Instances",oPipe);
			weapon.owner = id;
		}
	}
	
}


//Animate
if (hurt)
{
	sprite_index = sBugHurt;
}
else if (sprite_index == sBugWhip)
{
	//do nothing
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