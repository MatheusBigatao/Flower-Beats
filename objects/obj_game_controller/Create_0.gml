/// @description Insert description here
// You can write your code in this editor

//display_reset(2,true);

//show_debug_overlay(true);

// Informa se o player tem o triangulo (muda apenas no Level zero)
global.have_triangle = true;


enum Direcao_cardial{
	Norte = 90,
	Sul = 270,
	Leste = 0,
	Oeste = 180,
	Noroeste = 135,
	Nordeste = 45,
	Sudoeste = 225,
	Sudeste = 315
}

action = 1;




#region Parâmetros para Transição entre rooms
	target_room = noone;
	run_transition = false;
	_sprite = spr_transition;
	_sprite_width = sprite_get_width(_sprite)*0.6;
	_sprite_height = sprite_get_height(_sprite)*0.6;
	
	// N° de sprites necessários para preencher a câmera
	var _width_screen = display_get_gui_width();
	var _reference_x = 3840;
	_scale_multiplier = _width_screen / _reference_x;
	
	number_sprite_horizontal = display_get_gui_width() div (_sprite_width*_scale_multiplier) + 1;
	number_sprite_vertical = display_get_gui_height() div (_sprite_height*_scale_multiplier) + 1;
	
	// Set image_speed
	image_index_increment = sprite_get_speed(_sprite)/room_speed;
	_image_index_transition = 0;
	_image_index_transition_max = sprite_get_number(_sprite);
	
	// Transition Color
	_color = c_black;
	
	estado_trasicao = "saindo_room";
	//estado_trasicao = "entrando_room";
	
#endregion