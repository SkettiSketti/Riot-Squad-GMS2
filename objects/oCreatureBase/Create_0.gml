event_inherited()

//initCreature()
jumpHeight = 3;
canWhip = true;
weapon = noone;
hurt = false;
maxHp = 100;
hp = 100;
dead = false;
dashing = false;
canDash = true;
dashCooldown = 60;
alarm[0] = 0; //For when the object is hurt
alarm[1] = 0; //For when the creature is dashing
alarm[2] = 0; //For when the creature can dash again 

healthBar = instance_create_layer(x,y-16,"HealthBar",oHealthBarMini)
healthBar.owner = id;

function checkIfDead()
{
	dead = (hp <= 0)
}

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

function createTrail()
{
	var trail = instance_create_layer(x,y,"Trails",oTrail)
		trail.x = x
		trail.y = y
		trail.image_blend = make_colour_rgb(random_range(0,255), random_range(0,255), random_range(0,255))
		trail.sprite_index = sprite_index;
		trail.image_xscale = image_xscale;
}

function renderTrail()
{
	if (( sqrt(power(abs(velX),2) + power(abs(velY),2)) > 6 && hurt) || dashing)
	{
	
		createTrail();

	}

}

function moveWeapon()
{
	if (instance_exists(weapon))
	{
	
		if (weapon.image_index < 1)
		{
			weapon.x = x + (16 - 0.2) * - image_xscale;
			weapon.y = y
			weapon.image_xscale = image_xscale;
		}
		else if (weapon.image_index < 2)
		{
			weapon.x = x - (16 + 0.2) * - image_xscale
			weapon.y = y
			weapon.image_xscale = image_xscale;
		}
	}
}

function makeTransparentWhenDead()
{
	if (dead)
	{
		image_alpha = 0.5;
	}
}