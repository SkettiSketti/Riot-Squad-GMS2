//if (!other.hurt)
{
	other.y -= 1;
	other.velX = other.velX + image_xscale * knockbackX;
	other.velY = -5;
	other.hurt = true
	other.alarm[0] = 60;
}

audio_play_sound(sOuch,1,false);