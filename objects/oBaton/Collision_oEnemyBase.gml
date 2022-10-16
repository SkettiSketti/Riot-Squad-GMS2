var hurtValue = irandom_range(minDmg,maxDmg);
var crit = false;
//if not hurt, then play the sound and stun protect
if (!other.hurt)
{
	
	other.hurt = true
	other.alarm[0] = 45;
	
	//create hurt number and set it to current pos
	if (!other.dead)
	{
		hurtNumber = instance_create_layer(x,y,"HurtNumber",oHurtNumber);
		hurtNumber.xPos = x - 16
		hurtNumber.yPos = y 
		hurtNumber.num = hurtValue;
		
		
		
		//"Hitstop"
		var t = current_time + 25;
		while (current_time < t) { }
	
		if (irandom_range(1,10) < 3) //random crit
		{
			
			
			crit = true;
			hurtNumber.crit = crit;
			hurtNumber.num *= 2;
			if !audio_is_playing(sShoot4)
				audio_play_sound(sShoot4,1,false);
		}
		else 
		{
		
			if !audio_is_playing(sOuch)
				audio_play_sound(sOuch,1,false);
		}
	}
	else 
	{
		if !audio_is_playing(sOuch)
			audio_play_sound(sOuch,1,false);
		
	}

	//knock back no matter what
	var dir = sign(x - oPlayer.x )
	var bonusKnockbackX = 0;
	var bonusKnockbackY = 0;
	if (crit) 
	{
		bonusKnockbackX = dir * knockbackX * 2;
		bonusKnockbackY = knockbackY/2;
	}
	other.y -= 1;
	other.velX = other.velX + (dir * knockbackX) + bonusKnockbackX;
	other.velY = -knockbackY - bonusKnockbackY;
	
	//Killing blow!
	if (other.hp - hurtValue <= 0 && !other.dead)
	{
		
		
		//extra "Hitstop"
		var t = current_time + 25;
		while (current_time < t) { }
		
		other.fric = 0.025 //tiny friction to make them go flying
		
		//add more velocity
		other.velX += other.velX + image_xscale * knockbackX;
		other.velY += -knockbackY;
		if !audio_is_playing(sWoopWoop)
			audio_play_sound(sWoopWoop,1,false);
		
		for (var i = 0; i < 3; i++)
		{
			gold = instance_create_layer(x,y,"Instances",oGold);
			gold.xPos = x
			gold.yPos = y
			gold.velX = knockbackX * image_xscale + random_range(-6,6);
			gold.velY = -knockbackY;
		}
		
			
	}
	
	/*
	if (!other.dead)
	{
		for (var i = 0; i < 3; i++)
		{
			gold = instance_create_layer(x,y,"Instances",oGold);
			gold.xPos = x
			gold.yPos = y
			gold.velX = knockbackX * image_xscale + random_range(-6,6);
			gold.velY = -knockbackY;
		}
	}
	*/

	//Decrease Health 
	other.hp -= hurtValue

}
