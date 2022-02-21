/// scr_move (horizontal_speed , vertical_speed)
function scr_move(argument0, argument1) {

	var _velocidade_horizontal_final = argument0;
	var _velocidade_vertical_final = argument1;

#region Colisões Vertical e Horizontal


	// Colisão horizontal / aproxima o player até encostar na parede / subir as beiradas
	if (place_meeting(x+_velocidade_horizontal_final,y,obj_wall_collide))
	{	
			// Para subir as beiradas
		if (place_meeting(x + sign(_velocidade_horizontal_final), y, obj_wall_collide))
		{
			if (!place_meeting(x + sign(_velocidade_horizontal_final), y-5, obj_wall_collide))
			{
				y -=5;
			}
		}
		
		if (place_meeting(x+_velocidade_horizontal_final,y,obj_wall_collide))
		{
			if (place_meeting(x+_velocidade_horizontal_final,y+8,obj_wall_collide)) //poder se mover quando platform_moving_beat estiver acima e descendo
			{		
				while (!place_meeting(x+sign(_velocidade_horizontal_final),y,obj_wall_collide))
				{
					x += sign(_velocidade_horizontal_final);	
				}
				_velocidade_horizontal_final = 0;
			
				if (!place_meeting(x, y-10, obj_wall_collide)) // Se o obj_platform_moving_beat não estiver acima, zera a velocidade_horizontal
				{
					velocidade_horizontal = 0;	
				}
			} // Fim if debugar para platform_moving_beat

		} // Fim if que checa a colisao com a parede para parar o player
	
	}

	// Colisão Vertical / aproxima o player até encostar no chão ou teto
	if (place_meeting(x,y+_velocidade_vertical_final,obj_wall_collide))
	{
		var _collide_vertical = true;  // Rode o while loop para encostar no chão ou teto
		
		
		// Não colide com o teto se bater apenas na beirada do player
		if (_velocidade_vertical_final < 0)
		{
			var _offset = 36;
			var _saia_pela_direita = false;
			var _saia_pela_esquerda = false;
			var bate_a_cabeca = false;
			
			var _coord_rectangle1 = bbox_left + _offset;
			var _coord_rectangle2 = bbox_top + _velocidade_vertical_final;
			var _coord_rectangle3 = bbox_right - _offset;
			var _coord_rectangle4 = bbox_bottom;
			
			// Se o player não encostar no teto com o canto do corpo, ele não irá fazer a correcao
			var _collide = collision_rectangle(_coord_rectangle1, _coord_rectangle2, _coord_rectangle3, _coord_rectangle4, obj_wall_collide, false, false);
			if (_collide)
			{
				var bate_a_cabeca = true;		
			}
			
			// Checa se o espaço na diagonal está desocupado para ele deslizar para essa direção
			if (!place_meeting(x+_offset,y+_velocidade_vertical_final,obj_wall_collide))
			{
				var _saia_pela_direita = true;	
			}
			if (!place_meeting(x-_offset,y+_velocidade_vertical_final,obj_wall_collide))
			{
				var _saia_pela_esquerda = true;	
			}
			
			if (_saia_pela_direita and _saia_pela_esquerda)
			{
				var bate_a_cabeca = true;
				velocidade_vertical = 0;
			}
			
			
			// Faz com que ande um pouco para lado para não bater a cabeça em obstáculos pequenos
			if ( !bate_a_cabeca and (_saia_pela_direita or _saia_pela_esquerda))
			{
				var _collide_vertical = false;		// Não rodar o while loop
				
				var _direcao = _saia_pela_direita - _saia_pela_esquerda;
				
				for ( var _i = 2; _i <= _offset ; _i +=2)
				{
					if (!place_meeting(x +_direcao * _i ,y+_velocidade_vertical_final,obj_wall_collide))
					{
						x += _direcao * _i;
						y = round(y + _velocidade_vertical_final) ;
						
						_velocidade_vertical_final = 0;
						//velocidade_vertical = 0;
						break;
					}
				}
			} 

			
		}
		
		
		while (_collide_vertical and !place_meeting(x,y+sign(_velocidade_vertical_final),obj_wall_collide))
		{
			y += sign(_velocidade_vertical_final);	
		}
		if ( sign(_velocidade_vertical_final)>0)	steps_restantes_coyote = coyote_time;
		
		_velocidade_vertical_final = 0;
		if (velocidade_vertical >0) velocidade_vertical =0;
		//velocidade_vertical = 0; 
	}

#endregion



#region Atualiza posição

		x = round(x + _velocidade_horizontal_final) ;
		y = round(y + _velocidade_vertical_final) ;
	
#endregion



#region Player Preso dentro da parede

	if (place_meeting(x,y,obj_wall_collide))
	{
		//debug = true;
		for (var _i =1; _i < 1000; _i++)
		{
			//Down
			if(!place_meeting(x,y+_i,obj_wall_collide))
			{
				y += _i;
				break;
			}
			
			//Right
			if(!place_meeting(x+_i,y,obj_wall_collide))
			{
				x += _i;
				break;
			}
		
			//Left
			if(!place_meeting(x -_i,y,obj_wall_collide))
			{
				x -= _i;
		
			break;
			}
			//Up
			if(!place_meeting(x,y -_i,obj_wall_collide))
			{
				y -= _i;
				break;
			}
		
			//Top Right
			if(!place_meeting(x+_i,y -_i,obj_wall_collide))
			{
				x += _i;
				y -= _i;
				break;
			}
		
			//Top Left
			if(!place_meeting(x-_i,y- _i,obj_wall_collide))
			{
				x -= _i;
				y -= _i;
				break;
			}
		
			//Down Right
			if(!place_meeting(x+_i,y+_i,obj_wall_collide))
			{
				x += _i;
				y += _i;
				break;
			}
		
			//Down Left
			if(!place_meeting(x-_i,y+_i,obj_wall_collide))
			{
				x -= _i;
				y += _i;
				break;
			}
		}
	}
	//else debug = false;

#endregion





}
