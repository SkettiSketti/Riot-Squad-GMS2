function initCreature()
{
	spd = 0.5;
	fric = 0.1;
	maxSpd = 8;
	jumpHeight = 3;
	velX = 0;
	velY = 0;
	grav = 0.2;
	canWhip = true;
	weapon = noone;
	hurt = false;
	maxHp = 100;
	hp = 100;
	dead = false;
	onTheGround = false;
	alarm[0] = 0; //For when the object is hurt
	
}