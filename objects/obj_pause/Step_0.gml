/// @description Insert description here


	//PAUSA OU DESPAUSA
if (scr_get_input("start"))
{	
	// Se estiver no menu ele não pausa o jogo
	//if (!settings_ON and room !=rm_initial and !is_paused)
	if (!settings_ON and room !=rm_initial)
	{
			audio_play_sound(snd_select_option,140,false);
			alarm[0] = 1;
		}
	}


if (!is_paused or settings_ON) exit;

if (is_paused and audio_is_playing(global.current_music))
{
	audio_pause_sound(global.current_music);	
}

if (delay_option_counter >-1) delay_option_counter--;

#region Input gamepad ou Keyboard
	if (gamepad_is_connected(0) or keyboard_check_pressed(vk_anykey))
	{
		#region Alterando a opção selecionada com input

			var _right_press = 	scr_get_input("right");
			var _left_press =	scr_get_input("left");
			
			// Input do axis do gamepad não bugar
			if (delay_option_counter >-1)
			{
				_right_press = false;
				_left_press  = false;
			}
			
			if (_right_press or _left_press) delay_option_counter = delay_option;
			

			
			var _modify_option = _right_press - _left_press;
		
			hover += _modify_option;
			if (_modify_option !=0) audio_play_sound(snd_select_option,140,false);
		
			if (hover >3) hover = 0;
			else if (hover <0) hover = 3;
		#endregion
		
		#region Selecionando a opção
			var _input_confirm = scr_get_input("select_option");
				if ( _input_confirm)
				{
					audio_play_sound(snd_select_option,140,false);
					switch hover
					{
						case 3: // Botao de Resume - Despausa
							scr_resume_button();
						break;
						
						case 2: // Botao de Settings
							scr_settings_button();
						break;
						
						case 1: // Botao de Restart
							scr_restart_button();
						break;
						
						case 0: // Botao de Exit
							scr_exit_button();
						break;
					}
				}
		#endregion
	}#endregion

	#region Input do mouse // Realça a opção com o mouse em cima
	else
	{




	// Coordenadas do mouse
	var _mouse_x = device_mouse_x_to_gui(0);
	var _mouse_y = device_mouse_y_to_gui(0);

	//Referencia da resolucao
	var _width_screen = display_get_gui_width();
	var _height_screen = display_get_gui_height();
	var _reference_x = 3840;
	var _scale_multiplier = _width_screen / _reference_x;

#region Mouse só funciona para selecionar quando ele se move 
if (_mouse_x == previous_mouse_x and _mouse_y == previous_mouse_y) exit;

previous_mouse_x = _mouse_x;
previous_mouse_y = _mouse_y;
#endregion


	#region Botao Resume ou Start
		var _width = (sprite_get_width(spr_start) + 30) * _scale_multiplier;
		var _height = (sprite_get_height(spr_start) + 30)* _scale_multiplier;
	
		var _x1 = _width_screen * pos_x_resume - _width/2;
		var _y1 = _height_screen * pos_y_resume  - _height/2;
		var _x2 = _width_screen * pos_x_resume  + _width/2;
		var _y2 = _height_screen * pos_y_resume  + _height/2;
	
		if (point_in_rectangle(_mouse_x, _mouse_y, _x1, _y1, _x2, _y2))
		hover = 3;

	#endregion

		
	#region Botao Settings
		var _width = (sprite_get_width(spr_settings) + 30) * _scale_multiplier;
		var _height = (sprite_get_height(spr_settings) + 30)* _scale_multiplier;

		var _x1 = _width_screen * pos_x_settings  - _width/2;
		var _y1 = _height_screen * pos_y_settings - _height/2;
		var _x2 = _width_screen * pos_x_settings + _width/2;
		var _y2 = _height_screen * pos_y_settings + _height/2;

		if (point_in_rectangle(_mouse_x, _mouse_y, _x1, _y1, _x2, _y2))
		hover = 2;
	#endregion

	#region Botao Restart
		var _width = (sprite_get_width(spr_restart) + 30) * _scale_multiplier;
		var _height = (sprite_get_height(spr_restart) + 30)* _scale_multiplier;
	
		var _x1 = _width_screen * pos_x_restart - _width/2;
		var _y1 = _height_screen * pos_y_restart - _height/2;
		var _x2 = _width_screen * pos_x_restart + _width/2;
		var _y2 = _height_screen * pos_y_restart + _height/2;
	
		if (point_in_rectangle(_mouse_x, _mouse_y, _x1, _y1, _x2, _y2))
		hover = 1;
	#endregion

	#region Botao Exit ou Menu
		var _width = (sprite_get_width(spr_exit_door) + 30) * _scale_multiplier;
		var _height = (sprite_get_height(spr_exit_door) + 30)* _scale_multiplier;

		var _x1 = _width_screen * pos_x_exit - _width/2;
		var _y1 = _height_screen * pos_y_exit - _height/2;
		var _x2 = _width_screen * pos_x_exit + _width/2;
		var _y2 = _height_screen * pos_y_exit + _height/2;

		if (point_in_rectangle(_mouse_x, _mouse_y, _x1, _y1, _x2, _y2))
		hover = 0;

	#endregion
	}
	#endregion
	