var dir = (other.x - x)

var pushback = 0.05;

if (!other.dead)
{
	if (sign(dir) < 0)
	{
		velX += pushback;
		other.velX += -pushback;
	}
	else 
	{
		velX += -pushback;
		other.velX += pushback;
	}
}