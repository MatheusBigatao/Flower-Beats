/// @description Insert description here
// You can write your code in this editor

#region Se estiver se movendo, carrega o player e atualiza a posição
	if (is_moving)
	{	
		var delta_factor = scr_get_delta_factor();
		var _velocidade_plataforma = velocidade_plataforma*delta_factor;
		var moveY = _velocidade_plataforma;

			if (point_distance(x,y, x_final, y_final) <= _velocidade_plataforma)
			{
				moveY = y_final - y;
				chegou_ao_destino = true;
			}
		
		
		// Para de se mover
		if (chegou_ao_destino)
		{
			chegou_ao_destino = false;
			is_moving = false;
		}
		
			// Movimenta a plataforma
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
		
		var _x = x;
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
					
				}
				
				//// Movimentacao Horizontal
				//if (moveX !=0)
				//{
				//	//x += moveX;
				//	scr_move(moveX, 0);
				
				//}

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
	
} //Fim if que checa is_moving
#endregion
		
#endregion