event_inherited();
grav = 0;
spd = 0.30
atkSpd = 0.43
//atkSpd = 0.5
maxHp = 30
hp = maxHp
minDmg = 6
maxDmg = 7
knockbackX = 20
knockbackY = 3

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
	
	/*
	if (abs(x - oPlayer.x) > 50)
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
	*/
	
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
	
	//If far away stay in the air
	if (abs(x - oPlayer.x) > 10)
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
