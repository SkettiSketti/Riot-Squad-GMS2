event_inherited()
var hurtValue = irandom_range(minDmg,maxDmg);

//if not hurt, then play the sound and stun protect
if (!other.hurt)
{
	other.hurt = true
	other.alarm[0] = 45;
	
	if !audio_is_playing(sOuch)
		audio_play_sound(sOuch,1,false);
	//create hurt number and set it to current pos
	hurtNumber = instance_create_layer(x,y,"HurtNumber",oHurtNumber);
	hurtNumber.xPos = x - 16
	hurtNumber.yPos = y 
	hurtNumber.num = hurtValue;
	if (irandom_range(1,10) < 3) //random crit
	{
		hurtNumber.crit = true;
		hurtNumber.num *= 2;
	}

	if (other.hp - hurtValue <= 0 && !other.dead)
	{
		if !audio_is_playing(sWoopWoop)
			audio_play_sound(sWoopWoop,1,false);
	}
	
	//knock back no matter what
	other.y -= 1;
	other.velX = other.velX + image_xscale * knockbackX;
	other.velY = -knockbackY;

	//Decrease Health 
	other.hp -= hurtValue

}
