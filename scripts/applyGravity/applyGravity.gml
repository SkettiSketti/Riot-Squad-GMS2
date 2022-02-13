function applyGravity(index,onTheGround,velY,grav)
{
	if (!onTheGround) //275 is floor 
	{
		//apply gravity
		velY += grav;
	}
	else 
	{
		while (!onTheGround)
			y--;
		velY = 0;
	}
}