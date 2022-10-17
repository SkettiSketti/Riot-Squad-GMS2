//Destroy gold piece
instance_destroy()
//Make collection sound
if !audio_is_playing(sPling2)
	audio_play_sound(sPling2,1,false);
