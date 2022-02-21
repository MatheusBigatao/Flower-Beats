/// @description beat now ON

if (audio_is_playing(global.current_music))
{
	global.beat_now = true;
	show_debug_message("Beat NOW!" + string(n_beats))

	alarm[2] = 2; // 2 steps com a informação do beat como true
	
	global.state_beat_ON = !global.state_beat_ON;
}