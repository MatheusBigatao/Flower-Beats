/// @description Começar música

if (!audio_group_is_loaded(audiogroup_default)) 
{
	Alarm[0] = 2;
	exit;
}

// Não começa a música se estiver pausado
if (obj_pause.is_paused)
{
	Alarm[0] = 2;
	exit;
}
global.beat2_enabled = false;
timer_debug_beat = 0;
_debug_beat = false;
#region Inicia a musica dependendo da room

	switch room{
		
		case rm_initial:
			global.current_music = noone;
			audio_play_sound(snd_menu,100,true);
		break;
		
		//case rm_level1:
		//	global.current_music = audio_play_sound(snd_level1,100,false);
		//	global.tempo_beat = 1.33333333;
		//	delay_beat = 0;				// delay para primeiro beat
		//	length_intro = 0;			// duracao da intro até começar a parte que faz loop
		//	length_loop = 26.66;		// duracao do loop
		//	total_length = length_intro + length_loop;
		//	n_beats_when_loop = floor((length_intro - delay_beat)/global.tempo_beat);
		//	break;
		
		case rm_level0:
			global.current_music = audio_play_sound(snd_level0,100,false);
			global.tempo_beat = 1.397;
			delay_beat = 1;				// delay para primeiro beat
			length_intro = 2;			// duracao da intro até começar a parte que faz loop
			length_loop = 20;			// duracao do loop
			total_length = length_intro + length_loop;
			n_beats_when_loop = floor((length_intro - delay_beat)/global.tempo_beat);
			break;

		
		case rm_level1:
			global.current_music = audio_play_sound(snd_level1,100,false);
			global.tempo_beat = 1.397;
			delay_beat = 1.42;				// delay para primeiro beat
			length_intro = 10.065;			// duracao da intro até começar a parte que faz loop
			length_loop = 22.33;			// duracao do loop
			total_length = length_intro + length_loop;
			n_beats_when_loop = floor((length_intro - delay_beat)/global.tempo_beat);
			break;
			
		case rm_level2:
			global.current_music = audio_play_sound(snd_level4,100,false);
			global.tempo_beat = 1.072;
			delay_beat = 2.17;				// delay para primeiro beat
			length_intro = 1.83;			// duracao da intro até começar a parte que faz loop
			length_loop = 111.23;			// duracao do loop
			total_length = length_intro + length_loop;
			n_beats_when_loop = floor((length_intro - delay_beat)/global.tempo_beat);
			break;
			
		case rm_level3:
			global.current_music = audio_play_sound(snd_level6,100,false);
			global.tempo_beat = 2.0;
			delay_beat = 2.02;				// delay para primeiro beat
			length_intro = 16.02;			// duracao da intro até começar a parte que faz loop
			length_loop = 64.00;			// duracao do loop
			total_length = length_intro + length_loop;
			n_beats_when_loop = floor((length_intro - delay_beat)/global.tempo_beat);
			break;
			
			
		case rm_level4:
			global.current_music = audio_play_sound(snd_level2,100,false);
			global.tempo_beat = 1.00;
			delay_beat = 0.525;				// delay para primeiro beat
			length_intro = 7.93;			// duracao da intro até começar a parte que faz loop
			length_loop = 64;			// duracao do loop
			total_length = length_intro + length_loop;
			n_beats_when_loop = floor((length_intro - delay_beat)/global.tempo_beat);
			break;
			
		case rm_level5:
			global.current_music = audio_play_sound(snd_level5,100,false);
			global.tempo_beat = 1.025;
			delay_beat = 0.54;				// delay para primeiro beat
			length_intro = 47.20;			// duracao da intro até começar a parte que faz loop
			length_loop = 96.41;			// duracao do loop
			total_length = length_intro + length_loop;
			n_beats_when_loop = floor((length_intro - delay_beat)/global.tempo_beat);
			break;
			
		case rm_level6:
			global.current_music = audio_play_sound(snd_level9,100,false);
			global.tempo_beat = 0.96;
			delay_beat = 1.46;				// delay para primeiro beat
			length_intro = 1.51;			// duracao da intro até começar a parte que faz loop
			length_loop = 61.45;			// duracao do loop
			total_length = length_intro + length_loop;
			n_beats_when_loop = floor((length_intro - delay_beat)/global.tempo_beat);
			break;
			
		case rm_level7:
			global.current_music = audio_play_sound(snd_level10,100,false);
			global.tempo_beat = 1.06;
			delay_beat = 9.04;				// delay para primeiro beat
			length_intro = 9.23;			// duracao da intro até começar a parte que faz loop
			length_loop = 33.93;			// duracao do loop
			total_length = length_intro + length_loop;
			n_beats_when_loop = floor((length_intro - delay_beat)/global.tempo_beat);
			break;
			
			
		case rm_level8:
			global.current_music = audio_play_sound(snd_level12,100,false);
			global.tempo_beat = 0.60;
			delay_beat = 0.325;	// delay para o primeiro beat
			length_intro = 0.53;			// duracao da intro até começar a parte que faz loop
			length_loop = 76.805;			// duracao do loop
			total_length = length_intro + length_loop;
			n_beats_when_loop = floor((length_intro - delay_beat)/global.tempo_beat);
			break;
			
		#region FINAL LEVEL
			case rm_level_final1:
			global.current_music = audio_play_sound(snd_final_1,100,false);
			global.tempo_beat = 1.905;
			delay_beat = 0.515;	// delay para o primeiro beat
			length_intro = 0.475;			// duracao da intro até começar a parte que faz loop
			length_loop = 26.67;			// duracao do loop
			total_length = length_intro + length_loop;
			n_beats_when_loop = floor((length_intro - delay_beat)/global.tempo_beat);
			break;

			case rm_level_final2:
			global.current_music = audio_play_sound(snd_final_2,100,false);
			global.tempo_beat = 1.905;
			delay_beat = 3.62;	// delay para o primeiro beat
			length_intro = 3.115;			// duracao da intro até começar a parte que faz loop
			length_loop = 13.36;			// duracao do loop
			total_length = length_intro + length_loop;
			n_beats_when_loop = floor((length_intro - delay_beat)/global.tempo_beat);
			break;
			
			case rm_level_final3:
			global.current_music = audio_play_sound(snd_final_3,100,false);
			global.tempo_beat = 0.9525;
			delay_beat = 2.28;	// delay para o primeiro beat
			length_intro = 1.89;			// duracao da intro até começar a parte que faz loop
			length_loop = 13.335;			// duracao do loop
			total_length = length_intro + length_loop;
			n_beats_when_loop = floor((length_intro - delay_beat)/global.tempo_beat);
			break;

			case rm_level_final4:
			global.current_music = audio_play_sound(snd_final_4,100,false);
			global.tempo_beat = 0.9525;
			delay_beat = 2.7;	// delay para o primeiro beat
			length_intro = 2.795;			// duracao da intro até começar a parte que faz loop
			length_loop = 12.375;			// duracao do loop
			total_length = length_intro + length_loop;
			n_beats_when_loop = floor((length_intro - delay_beat)/global.tempo_beat);
			break;
			
			case rm_level_final5:
			global.current_music = audio_play_sound(snd_final_5,100,false);
			global.tempo_beat = 1.905;
			delay_beat = 2.29;	// delay para o primeiro beat
			length_intro = 17.035;			// duracao da intro até começar a parte que faz loop
			length_loop = 15.185;			// duracao do loop
			total_length = length_intro + length_loop;
			n_beats_when_loop = floor((length_intro - delay_beat)/global.tempo_beat);
			break;

		#endregion
	}

#endregion