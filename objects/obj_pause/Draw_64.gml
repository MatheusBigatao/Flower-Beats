/// @description 
if (is_paused and !settings_ON)
{
	
// Deixa a tela interia preta
	draw_clear(c_black);
	
	// Desenha o retangulo com borda grossa
	var _width_screen = display_get_gui_width();
	var _height_screen = display_get_gui_height();

	var _half_width = _width_screen/2;
	var _half_height = _height_screen/2;
	var _reference_x = 3840;
	var _reference_y = 2160;

	var _rec_x1 = _width_screen * 896/_reference_x;
	var _rec_y1 = _height_screen * 1040/_reference_y;
	var _rec_x2	= _width_screen * 2916/_reference_x;
	var _rec_y2 = _height_screen * 1544/_reference_y;

	var _line_width_rec = _width_screen * 60/_reference_x;

	var _scale_multiplier = _width_screen / _reference_x;

	scr_draw_rectangle_width_colour(_rec_x1,_rec_y1, _rec_x2, _rec_y2, _line_width_rec, c_white)


	//Botao Start
	var _pos_sprite_x = _width_screen *  pos_x_resume;
	var _pos_sprite_y = _height_screen * pos_y_resume;
	draw_sprite_ext(spr_start,0, _pos_sprite_x, _pos_sprite_y, _scale_multiplier, _scale_multiplier,0,c_white,1);
	
	//Botao Restart
	var _pos_sprite_x = _width_screen *  pos_x_restart;
	var _pos_sprite_y = _height_screen * pos_y_restart;
	draw_sprite_ext(spr_restart, 0, _pos_sprite_x, _pos_sprite_y, _scale_multiplier, _scale_multiplier,0,c_white,1);
	
	
	// Botao Settings
	var _pos_sprite_x = _width_screen * pos_x_settings;
	var _pos_sprite_y = _height_screen *pos_y_settings;
	draw_sprite_ext(spr_settings,0,_pos_sprite_x, _pos_sprite_y, _scale_multiplier, _scale_multiplier,0,c_white,1);



	// Botao Exit
	var _pos_sprite_x = _width_screen * pos_x_exit;
	var _pos_sprite_y = _height_screen * pos_y_exit;
	draw_sprite_ext(spr_exit_door,0,_pos_sprite_x, _pos_sprite_y, _scale_multiplier, _scale_multiplier,0,c_white,1);
	
	
	// Desenha a opção que está selecionada
	switch hover
	{
		case 3: // Botao Resume ou Start
			var _width = (sprite_get_width(spr_restart) + 30) * _scale_multiplier;
			var _height = (sprite_get_height(spr_restart) + 30)* _scale_multiplier;
	
			var _x1 = _width_screen * pos_x_resume - _width/2;
			var _y1 = _height_screen * pos_y_resume  - _height/2;
			var _x2 = _width_screen * pos_x_resume  + _width/2;
			var _y2 = _height_screen * pos_y_resume  + _height/2;
	
	break;

		
		case 2: // Botao Settings
			var _width = (sprite_get_width(spr_settings) + 30) * _scale_multiplier;
			var _height = (sprite_get_height(spr_settings) + 30)* _scale_multiplier;

			var _x1 = _width_screen * pos_x_settings  - _width/2;
			var _y1 = _height_screen * pos_y_settings - _height/2;
			var _x2 = _width_screen * pos_x_settings + _width/2;
			var _y2 = _height_screen * pos_y_settings + _height/2;
		break;

		case 1: // Botao Restart
			var _width = (sprite_get_width(spr_restart) + 30) * _scale_multiplier;
			var _height = (sprite_get_height(spr_restart) + 30)* _scale_multiplier;
	
			var _x1 = _width_screen * pos_x_restart - _width/2;
			var _y1 = _height_screen * pos_y_restart - _height/2;
			var _x2 = _width_screen * pos_x_restart + _width/2;
			var _y2 = _height_screen * pos_y_restart + _height/2;
		break;

		case 0: // Botao Exit ou Menu
			var _width = (sprite_get_width(spr_exit_door) + 30) * _scale_multiplier;
			var _height = (sprite_get_height(spr_exit_door) + 30)* _scale_multiplier;

			var _x1 = _width_screen * pos_x_exit - _width/2;
			var _y1 = _height_screen * pos_y_exit - _height/2;
			var _x2 = _width_screen * pos_x_exit + _width/2;
			var _y2 = _height_screen * pos_y_exit + _height/2;
		break;

	} // Fim switch que define o retangulo da opção selecionada
	
		draw_set_color(c_white);
		draw_set_alpha(0.2);
		draw_roundrect(_x1,_y1,_x2,_y2, false); // Contorno da região interagível
		draw_set_alpha(1.0);
}