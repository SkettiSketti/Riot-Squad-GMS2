event_inherited()
var hurtValue = irandom_range(minDmg,maxDmg);

//if not hurt, then play the sound and stun protect
if (!other.hurt)
{
	other.hurt = true
	other.alarm[0] = 30;
	
	if !audio_is_playing(sOuch)
		audio_play_sound(sOuch,1,false);
	//create hurt number and set it to current pos
	hurtNumber = instance_create_layer(x,y,"HurtNumber",oHurtNumber);
	hurtNumber.xPos = x - 16
	hurtNumber.yPos = y 
	hurtNumber.num = hurtValue;

	//knock back no matter what
	other.y -= 1;
	other.velX = other.velX + image_xscale * knockbackX;
	other.velY = -knockbackY;

	//Decrease Health 
	other.hp -= hurtValue

}
