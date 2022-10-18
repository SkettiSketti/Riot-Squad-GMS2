event_inherited();
grav = 0;
spd = 0.35
atkSpd = 0.5
hp = 10

//Override
function processGroundCollision(onTheGround)
{
	if (!dead)
	{
		if (hurt)
		{
			velY += defaultGrav;
		}
	
		while place_meeting(x,y,oWall) 
				y -= 1;
	
		//Bounce off ground
		if (onTheGround)
		{
			y -= 1;
			velY = -velY/2;
		}
	}
	else // dead 
	{
		//
		// The default physics
		//
		
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
			if (onTheGround && velY > 1)
			{
				y -= 1;
				velY = -velY/2;
			}
			else//Just stick to ground
			{
				velY = 0;
			}

	
		}
	}
	
}



//override
/*
function animate()
{
	if (hurt)
	{
		sprite_index = sFlyorHurt;
	}
	else 
	{
		sprite_index = sFlyorFly;
	}
}
*/

function flyToPlayer()
{
	if (dead || hurt)
	{
		grav = defaultGrav
		return;
	}
	else 
	{
		grav = 0
	}
	
	if (distance_to_object(oPlayer) > 50)
	{
		//attack the player
		if (x > oPlayer.x)
		{
			if (-maxSpd < velX)
				velX -=  spd;
		}
		else 
		{
			if (maxSpd > velX)
				velX +=  spd;
		}
	}
	else 
	{
		//attack the player
		if (x > oPlayer.x)
		{
			if (-maxSpd < velX)
				velX -=  atkSpd;
		}
		else 
		{
			if (maxSpd > velX)
				velX +=  atkSpd;
		}
	}
	//If far away stay in the air
	if (distance_to_object(oPlayer) > 50)
	{
		if (y > 220)
		{
			if (-maxSpd < velY)
				velY -= spd;
		}
		else 
		{
			if (maxSpd > velY)
				velY += spd;
		}
	}
	else //attack the player
	{
		if (y > oPlayer.y)
		{
			if (-maxSpd < velY)
				velY -= spd;
		}
		else 
		{
			if (maxSpd > velY)
				velY += spd;
		}
		
	}
	
	
}
