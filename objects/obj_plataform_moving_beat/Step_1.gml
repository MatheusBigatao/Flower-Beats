/// @description Insert description here
// You can write your code in this editor

var delta_factor = scr_get_delta_factor();
var _velocidade_plataforma = velocidade_plataforma*delta_factor;
// No BEAT, começa o movimento
if (global.beat_now)
{
	is_moving = true;
	
	// Define a direcao do movimento
	if (is_in_position_one) direcao = direcao_inicial_a_final;
	else direcao = direcao_inicial_a_final +180;
}

// Parâmetros da movimentação da plataforma
var moveX = round (lengthdir_x(_velocidade_plataforma, direcao)) ;
var moveY = round( lengthdir_y(_velocidade_plataforma, direcao) );

// Quando para de se mover, reabilita a animacao quando se mover denovo
if (!is_moving)
{
	ativar_animacao = true;
}
	
#region Se estiver se movendo, carrega o player e atualiza a posição
	if (is_moving)
	{	
		#region Checa se irá passar o destino a ajusta a velocidade para ir direto ao destino
		if (is_in_position_one)
		{
			if (point_distance(x,y, x_final, y_final) <= _velocidade_plataforma)
			{
				moveX = x_final - x;
				moveY = y_final - y;
				chegou_ao_destino = true;
			}
		}
		else
		{
			if (point_distance(x,y,x_initial, y_initial) <= _velocidade_plataforma)
			{
				moveX = x_initial - x;
				moveY = y_initial - y;
				chegou_ao_destino = true;
			}
		}
		#endregion
		
		// Para de se mover
		if (chegou_ao_destino)
		{
			chegou_ao_destino = false;
			is_in_position_one = !is_in_position_one;
			is_moving = false;
			
		}
		
			// Movimenta a plataforma
		x += moveX;
		y += moveY;
		
	#region Se o jogador estiver em cima da plataforma, ele será carregado
	if (point_distance(x,y,global.x_position_player, global.y_position_player) < 2000)
	{
		if (moveY<0) // Para debugar player atravessando a plataforma por estar muito rápido
		{
			offset_check_collision_debug = round (_velocidade_plataforma);	
		}
		else
		{
			offset_check_collision_debug = 3;	
		}
		
		var _x = x-moveX;
		var _y = y-moveY;
		//var _x = x;
		//var _y = y;
		// Player em cima da plataforma
		if (place_meeting(_x,_y-offset_check_collision_debug, obj_player))
		{

			with(obj_player)
			{	
				//Movimentacao Vertical
				if (moveY != 0)
				{		
					y += moveY;
					
				// Dá momentum ao player
				//if (moveY < 0) momentum_up = true;
				}
				
				// Movimentacao Horizontal
				if (moveX !=0)
				{
					//x += moveX;
					scr_move(moveX, 0);
				
				// Dá momentum ao player
				//if (moveX > 0) momentum_right = true;
				//else momentum_left = true;
				}

			} // Fim with do player
		} // Fim if place_meeting
		else if (moveY>0 and place_meeting(_x,_y+3, obj_player)) // Debugar player grudado embaixo da plataforma
		{
			with (obj_player)
			{
				//scr_move(0,moveY);
				y += moveY;
			}	
		}
		
	} // Fim if que checa distância com player
#endregion
		
		
	// Ativa uma unica vez durante o movimento
	if (!desabilite_animacao and ativar_animacao)
	{
		ativar_animacao = false;
			// Estica e comprime a plataforma no movimento
			// Prioriza o movimento vertical quando comprimir
			if (moveX != 0)
			{
				xscale *= estica_escala;
				yscale *= comprime_escala;

			}
			else
			{
				if (moveY != 0)
				{
				xscale *= comprime_escala;
				yscale *= estica_escala;
				}
			}
		}
	}

#endregion

xscale = lerp(xscale,initial_xscale,0.2);
yscale = lerp(yscale,initial_yscale,0.2);
