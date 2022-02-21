/// @description Variaveis

audio_group_load(audiogroup_default);
_debug_beat = false;
timer_debug_beat = 0;
length_intro = 0;			// duracao da intro até começar a parte que faz loop
length_loop = 0;			// duracao do loop
total_length = 0;

global.beat_now = false;
//global.tempo_beat = 1.3333333333;
global.beat2_enabled = false;

global.track_music = 0;
global.current_music = noone;

global.delta_factor = scr_get_delta_factor();
n_beats = 0;
offset_track = 1/50;

// Iniciando alarmes com delta_time
#macro ALARM_INACTIVATE -100

for (var i = 12; i>0; i--)
{
	Alarm[i] = ALARM_INACTIVATE;	
}

global.state_beat_ON = false;

