var xDir = keyboard_check(vk_right) - keyboard_check(vk_left)
var jump = keyboard_check_pressed(ord("X"));
var whip = keyboard_check_pressed(ord("C"));
onTheGround = place_meeting(x,y + 1, oWall);


//Can whip (timer is done)
if (!dead && whip && canWhip && sprite_index != sBlueWhip)
{
	canWhip = false;
	image_index = 0;
	sprite_index = sBlueWhip;
	
	
	weapon = instance_create_layer(x,y,"Instances",oBaton);
	weapon.owner = id;
	audio_play_sound(sSwipe,1,false);
}


//Move guy
if (!dead && xDir != 0) 
{
	image_xscale = xDir;
	velX += image_xscale * spd;
}


//jump
if (!dead && onTheGround && jump && !hurt)
{
	y -= 1; //fixes bug where you need to be off the ground to jump
	velY -= jumpHeight;
}




event_inherited();



//Animate
if (hurt)
{
	sprite_index = sBlueHurt;
}
else if (sprite_index == sBlueWhip)
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


if (dead)
{
	sprite_index = sBlueDefeat
}