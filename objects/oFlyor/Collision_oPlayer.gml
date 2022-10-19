
//Bounce off player
if (!hurt && !dead)
{
	if (x < other.x)
	{
		velX -= 10;
		velY -= 5;
	}
	else 
	{
		velX += 10;
		velY -= 5;
	}
}

var hurtValue = irandom_range(minDmg,maxDmg);


//Don't hurt player if dead
if (dead)
	return;

if (other.dashing) return; //Don't attack when he's dashing

if (!other.hurt)
{
	other.alarm[0] = 40;
	other.hurt = true
	
	if !audio_is_playing(sOuch)
		audio_play_sound(sOuch,1,false);
		
	/*
	--Commented out because I want to only see player hurt number--
	--it will also conflict with the number stack logic
	//create hurt number and set it to current pos
	hurtNumber = instance_create_layer(x,y,"HurtNumber",oHurtNumber);
	hurtNumber.xPos = x - 16
	hurtNumber.yPos = y 
	hurtNumber.num = hurtValue;
	*/
	other.canWhip = false

	if (other.hp - hurtValue <= 0 && !other.dead)
	{
		if !audio_is_playing(sWoopWoop)
			audio_play_sound(sWoopWoop,1,false);
	}
	
	//Decrease Health 
	other.hp -= hurtValue

	//knock back no matter what
	other.y -= 1;
	other.velX = other.velX + image_xscale * knockbackX;
	other.velY = -knockbackY;


	
}
