/// @description Insert description here
// You can write your code in this editor

if (settings_ON or !is_paused) exit;


// Coordenadas do mouse
var _mouse_x = device_mouse_x_to_gui(0);
var _mouse_y = device_mouse_y_to_gui(0);

//Referencia da resolucao
var _width_screen = display_get_gui_width();
var _height_screen = display_get_gui_height();
var _half_width = _width_screen/2;
var _reference_x = 3840;
var _scale_multiplier = _width_screen / _reference_x;
	

#region Botao Resume ou Start
	var _width = (sprite_get_width(spr_restart) + 30) * _scale_multiplier;
	var _height = (sprite_get_height(spr_restart) + 30)* _scale_multiplier;
	
	var _x1 = _width_screen * pos_x_resume - _width/2;
	var _y1 = _height_screen * pos_y_resume  - _height/2;
	var _x2 = _width_screen * pos_x_resume  + _width/2;
	var _y2 = _height_screen * pos_y_resume  + _height/2;
	
	// Clicou no botao Resume - Despausa
	if (point_in_rectangle(_mouse_x, _mouse_y, _x1, _y1, _x2, _y2))
	{
		audio_play_sound(snd_select_option,140,false);
		scr_resume_button();
	}
#endregion

#region Botao Restart
	var _width = (sprite_get_width(spr_restart) + 30) * _scale_multiplier;
	var _height = (sprite_get_height(spr_restart) + 30)* _scale_multiplier;
	
		var _x1 = _width_screen * pos_x_restart - _width/2;
		var _y1 = _height_screen * pos_y_restart - _height/2;
		var _x2 = _width_screen * pos_x_restart + _width/2;
		var _y2 = _height_screen * pos_y_restart + _height/2;
		
	// Clicou no botao Restart - Começa a fase do início
	if (point_in_rectangle(_mouse_x, _mouse_y, _x1, _y1, _x2, _y2))
	{
		audio_play_sound(snd_select_option,140,false);
		scr_restart_button();
	}
#endregion
		
#region Botao Settings
	var _width = (sprite_get_width(spr_settings) + 30) * _scale_multiplier;
	var _height = (sprite_get_height(spr_settings) + 30)* _scale_multiplier;

	var _x1 = _width_screen * pos_x_settings  - _width/2;
	var _y1 = _height_screen * pos_y_settings - _height/2;
	var _x2 = _width_screen * pos_x_settings + _width/2;
	var _y2 = _height_screen * pos_y_settings + _height/2;

	// Clicou no botao Settings
if (point_in_rectangle(_mouse_x, _mouse_y, _x1, _y1, _x2, _y2))
{
	audio_play_sound(snd_select_option,140,false);
	scr_settings_button();
}
#endregion



#region Botao Exit ou Menu
	var _width = (sprite_get_width(spr_exit_door) + 30) * _scale_multiplier;
	var _height = (sprite_get_height(spr_exit_door) + 30)* _scale_multiplier;

	var _x1 = _width_screen * pos_x_exit - _width/2;
	var _y1 = _height_screen * pos_y_exit - _height/2;
	var _x2 = _width_screen * pos_x_exit + _width/2;
	var _y2 = _height_screen * pos_y_exit + _height/2;
	
	// Clicou no Exit - Volta para o Menu
	if (point_in_rectangle(_mouse_x, _mouse_y, _x1, _y1, _x2, _y2))
	{
		audio_play_sound(snd_select_option,140,false);
		scr_exit_button();

	}
#endregion