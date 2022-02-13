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


//jump
if (onTheGround && jump)
{
	y -= 1; //fixes bug where you need to be off the ground to jump
	velY -= jumpHeight;
}




event_inherited();



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


if (dead)
{
	sprite_index = sBlueDefeat
}