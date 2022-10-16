spd = 0.5;
fric = 0.1;
maxSpd = 8;
velX = 0;
velY = 0;
defaultGrav = 0.2;
grav = 0.2;
onTheGround = false;

function preventLeavingTheScreen()
{
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

}


function applyVelocity()
{
	x += velX;
	y += velY;
}

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
			velY = -velY/2;
		}
		else//Just stick to ground
		{
			velY = 0;
		}

	
	}
}

function limitSpeed()
{
	//Limit speed
	if (abs(velX) > maxSpd)
	velX = sign(velX) * maxSpd;

	//Limit speed
	if (abs(velY) > maxSpd)
	velY = sign(velY) * maxSpd;


}

function applyFriction(onTheGround)
{
	if (onTheGround)
	{
		velX += -velX * fric;
	}
	else 
	{
		//less friction when in the air
		velX += -velX * fric/1.25;
	}
}

function applyThreshold()
{
	//Threshold for when the player should just not move
	if (abs(velX) < 0.01)
		velX = 0;
}