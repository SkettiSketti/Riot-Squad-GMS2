var dir = (other.x - x)

if (!oBug.dead)
{
	if (sign(dir) < 0)
	{
		velX += 0.2;
	}
	else 
	{
		velX -= 0.2;
	}
}