/// @description Insert description here
// You can write your code in this editor

velocidade_contracao = initial_veloc_contracao*global.delta_factor;


// Altera o estado atual no beat
if (global.state_beat_ON == referencia_beat_ON)
{
	contract_next_beat = referencia_contract_next_beat;
}
else
{
	contract_next_beat = !referencia_contract_next_beat;	
}


if ( contract_next_beat ) 
{
	var _escala_final_x = escala_contracao_x;
	var _escala_final_y = escala_contracao_y;
	
	var _done_scale_x = abs(image_xscale) <=  abs(_escala_final_x*(1.01));
	var _done_scale_y =  abs(image_yscale) <=  abs(_escala_final_y*(1.01));
}
else
{
	var _escala_final_x = escala_esticado_x;
	var _escala_final_y = escala_esticado_y;
	
	var _done_scale_x =  abs(image_xscale) >=  abs(_escala_final_x*(0.99));
	var _done_scale_y =  abs(image_yscale) >=  abs(_escala_final_y*(0.99));
}

//Estica na Horizontal
if (change_horizontal and !_done_scale_x)
{
	// Altera a escala
	var _image_xscale = lerp(image_xscale, _escala_final_x, velocidade_contracao);
	var _sprite_width_final = _image_xscale*sprite_get_width(sprite_index);
	
	image_xscale = _image_xscale;
	
	// Colisao a esquerda
	if( place_meeting(x-3,y, obj_player))
	{
		var pos_inicial_x = left_corner[0];
		var pos_final_x = x-_sprite_width_final/2;
		
		with(obj_player)
			{
				//y += pos_final_y-pos_inicial_y;
				scr_move( pos_final_x-pos_inicial_x,0);
			}
	}
	
	// Colisao a direita
	if( place_meeting(x+3,y, obj_player))
	{
		var pos_inicial_x = right_corner[0];
		var pos_final_x = x+_sprite_width_final/2;
		
		with(obj_player)
			{
				//y += pos_final_y-pos_inicial_y;
				scr_move( pos_final_x-pos_inicial_x,0);
			}
	}
	
	
		
}


//Estica na Vertical
if (change_vertical and !_done_scale_y)
{	
	// Altera a escala
	var _image_yscale = lerp(image_yscale,_escala_final_y, velocidade_contracao);
	var _sprite_height_final = _image_yscale*sprite_get_height(sprite_index);
	
	var pos_inicial_y = up_corner[1];
	var pos_final_y = y-_sprite_height_final/2;

		
	//var _escala_final = escala_esticado_y;
	//image_yscale = lerp(image_yscale,_escala_final, velocidade_contracao);
	image_yscale = _image_yscale;
	
		// Arrasta player para cima ou para baixo
	if (place_meeting(x,y-3, obj_player))
	{
		with(obj_player)
		{
			y += pos_final_y-pos_inicial_y;
			//scr_move(0, pos_final_y-pos_inicial_y);
		}
	}
	
}

// Posicoes de cada canto
left_corner[0] = x;
left_corner[1] = y+sprite_height/2;

right_corner[0] = x+sprite_width;
right_corner[1] = y+sprite_height/2;

up_corner[0] = x + sprite_width/2;
up_corner[1] = y;

down_corner[0] = x + sprite_width/2;
down_corner[1] = y+sprite_height;

