// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// Botoes em PAUSE

function scr_restart_button(){
		instance_activate_object(obj_game_controller);
		//instance_activate_object(obj_camera);
		//instance_activate_object(obj_draw_controller);
		//instance_activate_object(obj_audio_controller)
		//audio_stop_all();
		//is_paused = false;
		alarm[0] = 1;
		scr_change_room(room);
}

function scr_resume_button(){
	alarm[0] = 1;
	
}

function scr_settings_button(){
	instance_create_depth(x,y, depth, obj_settings);
	settings_ON = true;
}

function scr_exit_button(){
	instance_activate_object(obj_game_controller);
		//instance_activate_object(obj_camera);
		//instance_activate_object(obj_draw_controller);
		//instance_activate_object(obj_audio_controller)
		//audio_stop_all();
		//is_paused = false;
		alarm[0] = 1;
		scr_change_room(rm_initial);
		//room_goto(rm_initial);
}

// Botoes em Settings

function scr_settings_volume(_selected){
		// Atribui o volume
	audio_master_gain((_selected-1)/10);
}

function scr_settings_resolution(_selected){
	instance_activate_object(obj_camera);
						
	switch _selected // Atribui a resolucao escolhida ao obj_camera
	{
		case 2: // "1920x1080"
			with (obj_camera)
			{
				view_width = 1920;
				view_height = 1080;
				if (!window_get_fullscreen())
				{
					window_set_size(view_width,view_height);
					surface_resize(application_surface, view_width, view_height)
					alarm[1] = 1 // Centraliza a janela e desativa objeto
				}
			}
		break;
							
		case 1: // "1280x720"
			with (obj_camera)
			{
				view_width = 1280;
				view_height = 720;
				if (!window_get_fullscreen())
				{
					window_set_size(view_width,view_height);
					surface_resize(application_surface, view_width, view_height)
					alarm[1] = 1 // Centraliza a janela e desativa objeto
				}
			}
		break;
							
		case 0: // "960x540"
			with (obj_camera)
			{
				view_width = 960;
				view_height = 540;
				if (!window_get_fullscreen())
				{
					window_set_size(view_width,view_height);
					surface_resize(application_surface, view_width, view_height)
					alarm[1] = 1 // Centraliza a janela e desativa objeto
				}
			}
		break;
	}
}

function scr_settings_fullscreen(_selected){
	#region Aplica o Fullscreen ou modo janela
	instance_activate_object(obj_camera);
	if(_selected == 0) // Fullscreen
		{
			with (obj_camera)
			{
				window_set_fullscreen(true);
				var _width = camera_get_view_width(view_camera[0]);
				var _height = camera_get_view_height(view_camera[0]);
				window_set_size(_width,_height);
				surface_resize(application_surface, _width, _height)
			}
		}
		else //Modo Janela
		{
			with (obj_camera)
			{
				window_set_fullscreen(false);
				window_set_size(view_width,view_height);
				surface_resize(application_surface, view_width, view_height)
			}

		}
	instance_deactivate_object(obj_camera);
	#endregion
}

function scr_settings_paleta_cores(_selected){
		instance_activate_object(obj_draw_controller);
		with(obj_draw_controller)
		{
			paleta_cores = _selected;
			scr_altera_paleta_cores(paleta_cores);
			scr_altera_cor_player_e_background();
			var _color_background = color_background;
			var _color_background_2 = color_background_2;
			var _color_platforms = color_platforms;
			var _color_walls	= color_walls;
			var _player_white	= player_white;
		}

			color_background = _color_background
			color_background_2 = _color_background_2;
			player_white = _player_white;
			color_walls = _color_walls;
			color_platforms = _color_platforms;
		instance_deactivate_object(obj_draw_controller);
}

function scr_settings_rain(_selected){
		instance_activate_object(obj_draw_controller);
		var _have_rain_background = !_selected; // Inverte o valor para se adequar a convenção utilizada no array
		with (obj_draw_controller)
		{
			have_rain_background = _have_rain_background;
			if (have_rain_background)
			{
				var _id_background_2 = layer_background_get_id("Backgrounds_1");
				layer_background_visible(_id_background_2,true);
			}
			else
			{
				var _id_background_2 = layer_background_get_id("Backgrounds_1");
				layer_background_visible(_id_background_2,false);	
			}
		}
		instance_deactivate_object(obj_draw_controller);
							
							have_rain_background = _have_rain_background; 
}

function scr_settings_exit() {

	audio_play_sound(snd_select_option,140,false);
	obj_pause.settings_ON = false;
	instance_destroy();	
}