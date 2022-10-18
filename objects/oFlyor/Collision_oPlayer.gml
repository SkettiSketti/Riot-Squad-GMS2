
//Bounce off player
if (!hurt && !dead)
{
	if (x < other.x)
	{
		velX -= 10;
		velY -= 5;
	}
	else 
	{
		velX += 10;
		velY -= 5;
	}
}