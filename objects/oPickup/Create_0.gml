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
			
			//Make sound
			if !audio_is_playing(sPling1)
				audio_play_sound(sPling1,1,false);
			
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

function magnetizeToNearestPlayer()
{
	player = instance_nearest(x,y,oPlayer);
	
	if (distance_to_object(player) < player.magnetRange)
	{
		if (x - player.x > 0)
		{
			velX -= player.magnetStrength;
		}
		else 
		{
			velX += player.magnetStrength;
		}
		
		if (y - player.y > 0)
		{
			velY -= player.magnetStrength - grav;
		}
		else 
		{
			velY += player.magnetStrength + grav;
		}
		
	}
	
}