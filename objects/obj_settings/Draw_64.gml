/// @description Insert description here
// You can write your code in this editor

draw_clear(c_black);

// Desenhando o Retangulo em volta
var _width_screen = display_get_gui_width();
var _height_screen = display_get_gui_height();
var _reference_x = 3840;
var _reference_y = 2160;


var _rec_x1 = _width_screen * left_rec/_reference_x;
var _rec_y1 = _height_screen * top_rec/_reference_y;
var _rec_x2	= _width_screen * right_rec/_reference_x;
var _rec_y2 = _height_screen * bottom_rec/_reference_y;

var _line_width_rec = _width_screen * 60/_reference_x;
	
scr_draw_rectangle_width_colour(_rec_x1, _rec_y1, _rec_x2, _rec_y2, _line_width_rec, c_white);

// Referencia de posicao para cada item e escala 
var _scale_multiplier = _width_screen / _reference_x;
var _distancia_entre_item = distancia_entre_item_y*_scale_multiplier;

var _x_inicial = 1440*_scale_multiplier;
var _y_inicial = 480*_scale_multiplier;

#region Desenhando as opções
var _size = ds_list_size(lista_opcoes);

for (var _i = 0; _i<_size; _i++)
{
	var _array = lista_opcoes[| _i];
	var _name = _array[Settings_properties.Name];
	var _selected = _array[Settings_properties.Selected];
	var _values = _array[Settings_properties.Values];
	
	// Posicionamento
	var _x = _x_inicial;
	var _y = _y_inicial + _distancia_entre_item*_i;
	
	// Desenha o retangulo ao redor da opçao selecionada
	if (hover_id == _i) 
	{
		
		var _x_ini = (1400 - sprite_get_width(spr_sound)/2)*_scale_multiplier;
		var _y_ini = (480 - sprite_get_height(spr_sound)/2)*_scale_multiplier;
		
		if (_name == "Close")
		{
			var _x1 = _x_ini;
			var _y1 = _y_ini + _distancia_entre_item*_i;
			var _x2 = _x_ini + 250 *_scale_multiplier;
			var _y2 = _y1 + _distancia_entre_item - offset_entre_item_y*_scale_multiplier;
		}
		else 
		{
			var _x1 = _x_ini;
			var _y1 = _y_ini + _distancia_entre_item*_i;
			var _x2 = _x_ini + (width_option + offset_width_option_rectangle) *_scale_multiplier;
			var _y2 = _y1 + _distancia_entre_item - offset_entre_item_y*_scale_multiplier;
		}
		
		draw_set_color(c_white);
		draw_set_alpha(0.2);
		draw_roundrect(_x1,_y1,_x2,_y2, false); // Contorno da região interagível
		draw_set_alpha(1.0);
	}
	
	// Se tem mais de uma opção selecionável
	if (_selected > -1)
	{
		var _val = _values[_selected];
		
		// Setas para mudar de opção
		var _x_change_left = _x + (width_option - distancia_entre_change_options)*_scale_multiplier;
		var _x_change_right = _x + (width_option + distancia_entre_change_options)*_scale_multiplier;
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_color(c_white);
		draw_text_transformed( _x + width_option*_scale_multiplier, _y, _val, _scale_multiplier, _scale_multiplier, 0);
		draw_sprite_ext(spr_change_option,0,_x_change_left,_y,_scale_multiplier,_scale_multiplier,0,c_white,1 );
		draw_sprite_ext(spr_change_option,0,_x_change_right,_y,_scale_multiplier,_scale_multiplier,180,c_white,1 );
		
		draw_set_valign(fa_top);
	}
	
	// Desenha sprite das opções
switch _name
{
	case "Volume":
		draw_sprite_ext(spr_sound,0,_x,_y,_scale_multiplier, _scale_multiplier, 0, c_white, 1);		
		//// DEBUGAR BOTAO
		//var _width = sprite_get_width(spr_change_option) * _scale_multiplier;
		//	var _height = sprite_get_height(spr_change_option) * _scale_multiplier;
			
		//var _x1 = _x_change_left - _width/2;
		//	var _y1 = _y - _height/2;
		//	var _x2 = _x_change_left + _width/2;
		//	var _y2 = _y + _height/2;
				
		//draw_rectangle(_x1,_y1, _x2, _y2, false);
	break;
					
	case "Resolucao":						
		draw_sprite_ext(spr_resize,0,_x,_y,_scale_multiplier, _scale_multiplier, 0, c_white, 1);
	break;
					
	case "Fullscreen":
		draw_sprite_ext(spr_fullscreen,0,_x,_y,_scale_multiplier, _scale_multiplier, 0, c_white, 1);
	break;
					
	case "Paleta_cores":
		draw_sprite_ext(spr_color,0,_x,_y,_scale_multiplier, _scale_multiplier, 0, c_white, 1);
	break;
					
	case "Chuvisco":
		draw_sprite_ext(spr_rain,0,_x,_y,_scale_multiplier, _scale_multiplier, 0, c_white, 1);
	break;
	
	case "Close":
		draw_sprite_ext(spr_arrow,0,_x,_y,_scale_multiplier, _scale_multiplier, 270, c_white, 1);
	break;
}
					
	//draw_set_color(c_red);
	//draw_set_halign(fa_left);
	//draw_text_transformed(_x, _y, _name, _scale_multiplier, _scale_multiplier,0);
	

	

}
#endregion

#region Desenhando como que está no jogo a nova paleta de cores
	var _rec_x1 = _width_screen * left_rec_show/_reference_x;
	var _rec_y1 = _height_screen* top_rec_show/_reference_y;
	var _rec_x2 = _width_screen * right_rec_show/_reference_x;
	var _rec_y2 = _height_screen* bottom_rec_show/_reference_y;
	
	var _width = _rec_x2-_rec_x1;
	var _height = _rec_y2-_rec_y1;
	
	// Background
	draw_set_color(color_background);
	draw_roundrect(_rec_x1,_rec_y1, _rec_x2, _rec_y2, false);
	
	// Background 2 (Chuvisco)
	if (have_rain_background)
	draw_sprite_ext(spr_background,2, _rec_x1+_width*0.5, _rec_y2-_height*0.5, _scale_multiplier,_scale_multiplier,90,color_background_2,1);
	
	// Walls
	draw_set_color(color_walls);
	draw_rectangle(_rec_x1, _rec_y2-_height/2, _rec_x1+_width/1.8, _rec_y2, false);
	
	// Plataformas
	draw_set_color(color_platforms);;
	draw_rectangle(_rec_x1+_width*0.6,_rec_y2-_height*0.5, _rec_x1+_width*0.9, _rec_y2-_height*0.6, false);
	
	draw_set_alpha(0.3);
	draw_rectangle(_rec_x1+_width*0.6,_rec_y2-_height*0.7, _rec_x1+_width*0.9, _rec_y2-_height*0.8, false);
	draw_set_alpha(1.0);
	
	// Draw Espinhos
	if (player_white) var _color = c_white;
	else				var _color = c_black;
	
	draw_sprite_ext(spr_spike,0, _rec_x1+_width*0.62, _rec_y2, _scale_multiplier,_scale_multiplier,90,_color,1);
	draw_sprite_ext(spr_spike,0, _rec_x1+_width*0.72, _rec_y2, _scale_multiplier,_scale_multiplier,90,_color,1);
	draw_sprite_ext(spr_spike,0, _rec_x1+_width*0.82, _rec_y2, _scale_multiplier,_scale_multiplier,90,_color,1);
	draw_sprite_ext(spr_spike,0, _rec_x1+_width*0.92, _rec_y2, _scale_multiplier,_scale_multiplier,90,_color,1);
	
	// Draw Player
	draw_set_color(c_white);
	if (player_white) var _sprite = spr_player;
	else				var _sprite = spr_player_black;
	
	draw_sprite_ext(_sprite,0, _rec_x1 + _width/2, _rec_y2-_height/2, _scale_multiplier,_scale_multiplier,0,c_white,1);
	
#endregion