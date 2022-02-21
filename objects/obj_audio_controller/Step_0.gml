/// @description Sincronia da musica com BEAT

if (global.current_music == noone) exit;

global.track_music = audio_sound_get_track_position(global.current_music);
var _track_music = global.track_music;
var _track_prox_beat = delay_beat + n_beats*global.tempo_beat - offset_track;

//_debug_beat = (_track_prox_beat - _track_music) > global.tempo_beat*0.2;
if (timer_debug_beat < global.tempo_beat*0.5)	timer_debug_beat +=  global.delta_factor/60; // Adiciona o tempo em seg
else											_debug_beat = true;

#region Ajusta o loop das musicas

	// Ajuste da sincronia
		if (_track_music >= _track_prox_beat and _debug_beat)
		{
			Alarm[1] = 1; // Faz o Beat
			n_beats++
			timer_debug_beat = 0;
			_debug_beat = false;
		}
				
		//// Loop da música
		if (_track_music > total_length)
		{
			audio_sound_set_track_position(global.current_music, _track_music-length_loop);
			n_beats = n_beats_when_loop+1;
		}

#endregion