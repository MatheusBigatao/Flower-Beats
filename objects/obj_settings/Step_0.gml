/// @description Insert description here
// You can write your code in this editor

if (delay_option_counter >-1) delay_option_counter--;


#region Input com gamepad ou keyboard
if (gamepad_is_connected(0) or keyboard_check_pressed(vk_anykey))
{
	#region Escolha as opções utilizando o gamepad ou keyboard
	
	var _input_confirm = scr_get_input("select_option")
	
	var _up_press = scr_get_input("up");
	var _down_press = scr_get_input("down");
	
	// Input do axis do gamepad não bugar
	if (delay_option_counter >-1)
	{
		_up_press = false;
		_down_press  = false;
	}
			
	if (_up_press or _down_press) delay_option_counter = delay_option;
		
	var _modify_hover = _down_press - _up_press; // Invertido por que está alterando o index do array
	
	hover_id += _modify_hover;
	if (_modify_hover !=0) audio_play_sound(snd_select_option,140,false);
	
	
	var _size_list = ds_list_size(lista_opcoes)
	if (hover_id > _size_list -1)
	{
		hover_id =0;	
	}
	else if (hover_id <0)
	{
		hover_id = _size_list -1;	
	}
	#endregion
	
	#region Modificando as opções com Input
	
		// Valores da lista de opções da opção selecionada (no hover)
		var _array = lista_opcoes[| hover_id];
		var _name = _array[Settings_properties.Name];
		var _selected = _array[Settings_properties.Selected];
		var _values = _array[Settings_properties.Values];	
	
		
		var _right_press = 	scr_get_input("right");
		var _left_press = scr_get_input("left");
		
		// Input do axis do gamepad não bugar
		if (delay_option_counter >-1)
			{
				_right_press = false;
				_left_press  = false;
			}
			
		if (_right_press or _left_press) delay_option_counter = delay_option;
		
		
		var _modify_option = _right_press - _left_press;
	
		#region Modificando a opção selecionada
			if (_selected > -1 and _modify_option != 0)
			{
				audio_play_sound(snd_select_option,140,false);
				_selected += _modify_option;
				if (_selected > array_length(_values)-1)
				{
					_selected = 0;	
				}
				else if (_selected < 0)
				{
					_selected = array_length(_values)-1;	
				}
			
				// Atribui o valor selecionado a lista (operador @ atribui, | apenas pega o valor
				_array[@ Settings_properties.Selected] = _selected;
				
				// Aplica a mudança efetuada
				switch _name
				{
					case "Volume":
						scr_settings_volume(_selected);
					break;
					
					case "Resolucao":
						scr_settings_resolution(_selected);
					break;
					
					case "Fullscreen":
						scr_settings_fullscreen(_selected);
					break;
					
					case "Paleta_cores":
						scr_settings_paleta_cores(_selected);
					break;
					
					case "Chuvisco":
						scr_settings_rain(_selected);
					break;
					
					
				} // Fim switch que aplica mudanças
			
			} // Fim if para opção com mais de uma configuração
		#endregion
	
		#region Sair do Settings
			if (_name == "Close")
			{
				if ( _input_confirm)
				{
					scr_settings_exit();
				}
			}
		#endregion
	
	#endregion
	exit; // Ignora a seção que utiliza o mouse
} // Fim if de Input de gamepad e keyboard
#endregion

#region Input com o mouse
else
{
	// Coordenadas do mouse
	var _mouse_x = device_mouse_x_to_gui(0);
	var _mouse_y = device_mouse_y_to_gui(0);
	var _mouse_press = mouse_check_button_pressed(mb_left);
	
	#region Mouse ativado para selecionar quando ele se move ou clica
if (_mouse_x == previous_mouse_x and _mouse_y == previous_mouse_y) var _active_mouse_select = false;
else															var _active_mouse_select = true;

_active_mouse_select = _active_mouse_select or _mouse_press;  // Ativa a seleção se clicou com o mouse


previous_mouse_x = _mouse_x;
previous_mouse_y = _mouse_y;
#endregion

		var _width_screen = display_get_gui_width();
		var _reference_x = 3840;
		var _scale_multiplier = _width_screen / _reference_x;
		var _distancia_entre_item = distancia_entre_item_y*_scale_multiplier;
	
		var _x_inicial = (1440 - sprite_get_width(spr_fullscreen)/2)*_scale_multiplier;
		var _y_inicial = (480 - sprite_get_height(spr_fullscreen)/2)*_scale_multiplier;
	

	// Fazendo selecionável as opçoes

	var _size = ds_list_size(lista_opcoes);

	for (var _i = 0; _i < _size; _i++)
	{
		// Coletando dados da opção dentro da lista
		var _array = lista_opcoes[| _i];
		var _name = _array[Settings_properties.Name];
		var _selected = _array[Settings_properties.Selected];
		var _values = _array[Settings_properties.Values];	
	
		// Definindo área interagível para essa opção
		var _x1 = _x_inicial;
		var _y1 = _y_inicial + _distancia_entre_item*_i;
		var _x2 = _x_inicial + (width_option + offset_width_option_rectangle) *_scale_multiplier;
		var _y2 = _y1 + _distancia_entre_item - offset_entre_item_y*_scale_multiplier;
	
		// Mouse em cima da opção
		var _hover = point_in_rectangle(_mouse_x, _mouse_y, _x1, _y1, _x2, _y2);
		
		_hover = _hover * _active_mouse_select; // Se o mouse não estiver ativo, retorna falso
		
		if (_hover)
		{
			hover_id = _i;
		
			// Selecionar opção "Clicável"
			if (_selected == -1 and _mouse_press)
			{
				switch _name
				{
					case "Close":
						scr_settings_exit();
					break;
				
				}
			}
		
			//Alterando os valores das opções ao clicar na seta / Rodar scrool
			if (_selected > -1)
			{
				// Muda o valor ao rolar o scroll
				var _wheel = mouse_wheel_up() - mouse_wheel_down();
			
				// Muda o valor ao clicar na seta
				var _width = sprite_get_width(spr_change_option) * _scale_multiplier;
				var _height = sprite_get_height(spr_change_option) * _scale_multiplier;
					
				var _x = 1440*_scale_multiplier;
				var _y = 480*_scale_multiplier + _distancia_entre_item*_i;
				var _x_change_left = _x + (width_option - distancia_entre_change_options)*_scale_multiplier;
				var _x_change_right = _x + (width_option + distancia_entre_change_options)*_scale_multiplier;
			
				#region Clicou na seta da esquerda

					var _x1 = _x_change_left - _width/2;
					var _y1 = _y - _height/2;
					var _x2 = _x_change_left + _width/2;
					var _y2 = _y + _height/2;
		
				// Clicou na seta da esquerda
				if (point_in_rectangle(_mouse_x, _mouse_y, _x1, _y1, _x2, _y2) and _mouse_press)
				{
					_wheel = -1;
				}
				#endregion 
			
				#region Clicou na seta da direita
		
					var _x1 = _x_change_right - _width/2;
					var _y1 = _y - _height/2;
					var _x2 = _x_change_right + _width/2;
					var _y2 = _y + _height/2;
		
				// Clicou na seta da direita
				if (point_in_rectangle(_mouse_x, _mouse_y, _x1, _y1, _x2, _y2) and _mouse_press)
				{
					_wheel = +1;
				}
				#endregion

				// Wheel Input altera os valores das opções
				if (_wheel !=0)
				{
					audio_play_sound(snd_select_option,140,false);
					_selected += _wheel;
					if (_selected > array_length(_values)-1)
					{
						_selected = 0;	
					}
					else if (_selected < 0)
					{
						_selected = array_length(_values)-1;	
					}
				
					// Atribui o valor selecionado a lista (operador @ atribui, | apenas pega o valor
					_array[@ Settings_properties.Selected] = _selected;
				
					// Aplica a mudança efetuada
					switch _name
					{
						case "Volume":
							scr_settings_volume(_selected);
						break;
					
						case "Resolucao":
							scr_settings_resolution(_selected);
						break;
					
						case "Fullscreen":
							scr_settings_fullscreen(_selected);
						break;
					
						case "Paleta_cores":
							scr_settings_paleta_cores(_selected);
						break;
					
						case "Chuvisco":
							scr_settings_rain(_selected);
						break;
					
					
					} // Fim switch que aplica mudanças
				
				} // Fim if do input do wheel
			
			} // Fim if se a opção tiver mais de uma opção
		
		} // Fim if hover
	
	} // Fim for loop para todas as opções



}
#endregion 