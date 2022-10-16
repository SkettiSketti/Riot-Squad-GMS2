event_inherited()

//override (more bounce)
function processGroundCollision(onTheGround)
{
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
			velY = -velY*0.80;
		}
		else//Just stick to ground
		{
			velY = 0;
		}

	
	}
}

//override (less friction)
function applyFriction(onTheGround)
{
	velX += -velX * fric/4;
}

function destroyIfNotBouncing()
{
	if (velX == 0)
	{
		instance_destroy()
	}
}