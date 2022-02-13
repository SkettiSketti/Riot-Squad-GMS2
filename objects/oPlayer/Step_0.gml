var xDir = keyboard_check(vk_right) - keyboard_check(vk_left)
var jump = keyboard_check_pressed(ord("Z"));
var whip = keyboard_check_pressed(ord("X"));
var onTheGround = place_meeting(x,y + 1, oWall);

//Can whip (timer is done)
if (whip && canWhip && sprite_index != sBlueWhip)
{
	canWhip = false;
	image_index = 0;
	sprite_index = sBlueWhip;
	
	weapon = instance_create_layer(x,y,"Instances",oBaton);
	audio_play_sound(sSwipe,1,false);
}


//Move guy
if (xDir != 0) 
{
	image_xscale = xDir;
	velX += image_xscale * spd;
}

//applyGravity(object_index,onTheGround,velY,grav) 

if (!onTheGround)
{
	//apply gravity
	velY += grav;
}
else 
{
	while place_meeting(x,y,oWall) y -= 1;
	velY = 0;
}


//jump
if (onTheGround && jump)
{
	velY -= jumpHeight;
}


x += velX;

y += velY;


//Limit speed
if (abs(velX) > maxSpd)
velX = sign(velX) * maxSpd;

//Limit speed
if (abs(velY) > maxSpd)
velY = sign(velY) * maxSpd;

//Animate
if (sprite_index == sBlueWhip)
{
	//do nothing
}
else if (!onTheGround)
{
	sprite_index = sBlueJump;
}
else if (abs(velX) > 1)
{
	sprite_index = sBlueWalk;
}
else 
{
	sprite_index = sBlueIdle;
}


velX += -velX * fric;


//Threshold for when the player should just not move
if (abs(velX) < 0.01)
	velX = 0;

if (instance_exists(weapon))
{
	
	if (weapon.image_index < 1)
	{
		weapon.x = x + 16 * - image_xscale;
		weapon.y = y
		weapon.image_xscale = image_xscale;
	}
	else if (weapon.image_index < 2)
	{
		weapon.x = x - 16 * - image_xscale
		weapon.y = y
		weapon.image_xscale = image_xscale;
	}
}
