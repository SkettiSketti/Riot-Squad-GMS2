
flyToPlayer()
event_inherited();

//animate
if (hurt)
{
	sprite_index = sFlyorHurt;
}
else if (dead)
{
	sprite_index = sFlyorDefeat;
}
else 
{
	sprite_index = sFlyorFly;
}

image_xscale = sign(velX) * 1;
