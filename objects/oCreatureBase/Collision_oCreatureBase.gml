var dir = (other.x - x)

var pushback = 0.05;

if (!other.dead && !dead)
{
	if (sign(dir) < 0)
	{
		other.velX += -pushback;
	}
	else 
	{
		other.velX += pushback;
	}
}