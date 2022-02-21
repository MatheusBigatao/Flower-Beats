/// @description Insert description here
// You can write your code in this editor

moveX = round (lengthdir_x(velocidade_plataforma, direcao)) ;
moveY = round( lengthdir_y(velocidade_plataforma, direcao) );


	// Faz o player atravessar a plataforma de baixo para cima
if (y > global.y_position_player)
{
	mask_index = spr_wall_floor;	
}
else mask_index = -1;

var actual_x = x;
var actual_y = y;


	actual_x += moveX;
	actual_y += moveY;
	
	// Inverte a direcao de movimento
	if ((actual_x >= x_max or actual_x <= x_min) and (actual_y >= y_max or actual_y <= y_min)) 
	{
		direcao += 180;
	}
	else
	{	
		// Se o jogador estiver em cima da plataforma, ele será carregado
		if (place_meeting(x,y-3, obj_player))
		{
			var _moveX = moveX;
			var _moveY = moveY;
		
			with(obj_player)
			{
				if (_moveX !=0)
				{
					//x += _moveX;
					scr_move(_moveX, 0);
				}
	
				if (_moveY != 0)
				{					
					if (place_meeting(x, y+ abs(_moveY),other) and !place_meeting(x,y,other))
					{
						y += _moveY;
					
						//scr_move(0, _moveY);
					}
				}
			}
		}
		
		// Movimenta a plataforma
		x = actual_x;
		y = actual_y;
	
	}
	
	

