/// @description Atualiza a posição e faz colisao

// Não move o jogador (ele apenas cai)
if (!can_walk)
{
	velocidade_horizontal =0;
	velocidade_vertical = velocidade_vertical* (velocidade_vertical >0);
}


	var velocidade_horizontal_final = velocidade_horizontal; //Já foi aplicado o delta_factor 
	var velocidade_vertical_final = velocidade_vertical *delta_factor;
	
	
// Movimenta e testa colisões
scr_move(velocidade_horizontal_final, velocidade_vertical_final);

	global.x_position_player = x;
	global.y_position_player = y;
	
	// Checa colisão com obj_kill_player
	if (instance_exists(obj_kill_player))
	{
		//if (check_collision==2 and place_meeting(x,y,obj_kill_player)) scr_player_get_killed();
		
		if (place_meeting(x,y,obj_kill_player)) scr_player_get_killed();
	}


//check_collision++

//if (check_collision > 2) check_collision = 0;

