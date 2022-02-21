/// @description 

if (is_paused)
{
	window_set_cursor(cr_none);
	is_paused = false;
	//instance_destroy(obj_button);
	
	instance_activate_all();
	audio_resume_all();
	//audio_play_sound(snd_pause,10,false);
}
else{
	window_set_cursor(cr_default);
	is_paused = true;	
	instance_deactivate_all(true);
	instance_activate_object(obj_draw_controller);
	audio_pause_all();
	hover = 3;
	//audio_play_sound(snd_pause,10,false);
	
}