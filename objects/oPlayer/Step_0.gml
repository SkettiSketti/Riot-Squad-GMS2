var xDir = keyboard_check(vk_right) - keyboard_check(vk_left)
var jump = keyboard_check_pressed(ord("X"));
var whip = keyboard_check_pressed(ord("C"));
var dash = keyboard_check_pressed(vk_shift);
onTheGround = place_meeting(x,y + 1, oWall);


if (dashing )
{
	createTrail();
	velX += 3 * image_xscale;
	velY = 0;; // cancel gravity
	image_alpha = 0.5;
}

if (dash && !dashing && canDash)
{
	dashing = true;
	canDash = false;
	alarm[1] = 15; //dash timer
	alarm[2] = dashCooldown; //dash cooldown	
	if !audio_is_playing(sWoopWoop)
			audio_play_sound(sWoopWoop,1,false);
	 //cancel whip
	
	
}

//Can whip (timer is done)
if (!dead && whip && canWhip && sprite_index != sBlueWhip && !dashing)
{
	canWhip = false;
	image_index = 0;
	sprite_index = sBlueWhip;
	
	
	weapon = instance_create_layer(x,y,"Instances",oBaton);
	weapon.owner = id;
	audio_play_sound(sSwipe,1,false);
}


//Move guy
if (!dead && xDir != 0 && !dashing) 
{
	
	if (canWhip ) //keep the player looking the same way when whipping and dashing
		image_xscale = xDir;
	
	
	velX += xDir * spd;
}


//jump
if (!dead && onTheGround && jump && !hurt && !dashing)
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