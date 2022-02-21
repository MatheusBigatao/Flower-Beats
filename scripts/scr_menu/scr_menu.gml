// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scr_select_options_menu()
{
	#region Utilizando gamepad ou keyboard
			
			var _input_confirm = scr_get_input("select_option");
		
			var _right_press = 	scr_get_input("right");
			var _left_press =	scr_get_input("left");
			
			// Input do axis do gamepad não bugar
			if (delay_option_counter >-1)
			{
				_right_press = false;
				_left_press  = false;
				delay_option_counter--
			}
			
			if (_right_press or _left_press) delay_option_counter = delay_option;
			
			var _modify_option = _right_press - _left_press;
			
			actual_option_menu += _modify_option;
			if (_modify_option !=0) audio_play_sound(snd_select_option,140,false);
			
			// Ao chegar na ultima opção, ele vlta para a primeira opção e vice-versa
			if (actual_option_menu > hover_credits) actual_option_menu = hover_exit;
			else if (actual_option_menu <hover_exit) actual_option_menu = hover_credits;
			
		#endregion
		
			
			#region Usando o Mouse para selecionar as opções
			
				#region Checa se irá selecionar com o mouse quando movimentar o mouse ou clicar
					var _mouse_x = device_mouse_x(0);
					var _mouse_y = device_mouse_y(0);
					var _mouse_press = mouse_check_button_pressed(mb_left);
		
					select_with_mouse = (_mouse_x != mouse_previous_x) or (_mouse_y != mouse_previous_y);
					
					select_with_mouse = select_with_mouse or _mouse_press;
		
					mouse_previous_x = _mouse_x;
					mouse_previous_y = _mouse_y;
				#endregion
				
				
				var _initial_option = actual_option_menu;
				if (select_with_mouse)
				{
					// Mouse sobre botão Start
					if (collision_point(_mouse_x, _mouse_y, obj_start_menu, false, false))
					{
						actual_option_menu = hover_start;
						if (_mouse_press) var _input_confirm = true;
					}
			
					// Mouse sobre botão Settings
					if (collision_point(_mouse_x, _mouse_y, obj_settings_menu, false, false))
					{
						actual_option_menu = hover_settings;
						if (_mouse_press) var _input_confirm = true;
					}
			
					// Mouse sobre botão Exit
					if (collision_point(_mouse_x, _mouse_y, obj_exit_menu, false, false))
					{
						actual_option_menu = hover_exit;
						if (_mouse_press) var _input_confirm = true;
					}
			
					// Mouse sobre botão Credits
					if (collision_point(_mouse_x, _mouse_y, obj_credits_menu, false, false))
					{
						actual_option_menu = hover_credits;	
						if (_mouse_press) var _input_confirm = true;
					}
			
					if (_initial_option != actual_option_menu)
						audio_play_sound(snd_select_option,140,false);
						
				}
				
			#endregion
			
			#region Input Confirma -> ações de cada botão
			
			if (_input_confirm)
			{
				switch actual_option_menu
				{
					case hover_start:
						scr_menu_start()
					break;
					
					case hover_settings:
						scr_menu_settings()
					break;
					
					case hover_exit:
						scr_menu_exit()
					break;
					
					case hover_credits:
						scr_menu_credits()
					break;
				}
			}
			
			#endregion	
}

function scr_menu_start(){
	select_level_active = true;
	instance_activate_layer("Select_level");
	instance_deactivate_layer("Menu");
	
}

function scr_menu_settings(){
	instance_deactivate_all(true);
	instance_activate_object(obj_draw_controller);
	instance_create_depth(x,y, depth, obj_settings_from_menu);
}

function scr_menu_exit(){
	game_end();
}

function scr_menu_credits(){
	credits_active = true;
	instance_activate_layer("Credits");
	obj_credits_controller.y = room_height + 50;
	instance_deactivate_layer("Menu");
}

function scr_credits_to_menu(){
			// Gamepad ou keyboard
			var _input_confirm = scr_get_input("select_option");
					
			#region Usando o Mouse para selecionar as opções
			
				#region Checa se irá selecionar com o mouse quando movimentar o mouse ou clicar
					var _mouse_x = device_mouse_x(0);
					var _mouse_y = device_mouse_y(0);
					var _mouse_press = mouse_check_button_pressed(mb_left);

				#endregion
					
				// Mouse sobre botão Return to Menu
				if (collision_point(_mouse_x, _mouse_y, obj_return_to_menu, false, false))
				{
					if (_mouse_press) var _input_confirm = true;
				}
				
			#endregion
			
			// Aciona o botão Return (Sai dos créditos e volta ao menu)
			if (_input_confirm)
			{
				audio_play_sound(snd_select_option,140,false);
				credits_active = false;
				instance_activate_layer("Menu");
				instance_deactivate_layer("Credits");
			}
}

function scr_select_level_to_menu() {
	// Gamepad ou keyboard
			var _input_confirm = scr_get_input("select_option");
					
			#region Usando o Mouse para selecionar as opções
			
				#region Checa se irá selecionar com o mouse quando movimentar o mouse ou clicar
					var _mouse_x = device_mouse_x(0);
					var _mouse_y = device_mouse_y(0);
					var _mouse_press = mouse_check_button_pressed(mb_left);

				#endregion
					
				// Mouse sobre botão Return to Menu
				if (collision_point(_mouse_x, _mouse_y, obj_return_to_menu, false, false))
				{
					if (_mouse_press) var _input_confirm = true;
				}
				
			#endregion
			
			// Aciona o botão Return (Sai dos créditos e volta ao menu)
			if (_input_confirm)
			{
				audio_play_sound(snd_select_option,140,false);
				select_level_active = false;
				instance_activate_layer("Menu");
				instance_deactivate_layer("Select_level");
			}
			
}

function scr_settings_from_menu_exit(){
	
	instance_activate_all();
	obj_menu_controller.settings_ON = false;
	instance_deactivate_layer("Select_level");
	instance_deactivate_layer("Credits");
	
	audio_play_sound(snd_select_option,140,false);
	instance_destroy();	
}