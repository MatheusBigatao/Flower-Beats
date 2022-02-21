/// @description 

delta_factor = scr_get_delta_factor();
//var seconds_passed = delta_time/1000000;
var move_speed_this_frame = speed_movement * delta_factor;
var gravidade_this_frame = gravidade * delta_factor;
//speed_movement = move_speed_this_frame;

// Se acabou de encostar no chão
var estava_no_chao = esta_no_chao;
esta_no_chao = place_meeting(x,y+1,obj_wall_collide);

//Animação ao encostar no chao
if (!estava_no_chao and esta_no_chao and velocidade_vertical >= 0)
{
	if ( timer_landing_animation >=30) // Garante que comeca a animacao após terminar a animacao anterior
	{
		xscale = initial_xscale;
		yscale = initial_yscale;
		
		xscale *= estica_escala;
		yscale *= comprime_escala;
		timer_landing_animation = 0;
	}
}
timer_landing_animation += (timer_landing_animation <=30);

// Velocidades diferentes se está no ar ou no chão // Altera o estado do personagem
// Checa se o personagem encontrou o chão apenas quando está caindo e não subindo
//if (esta_no_chao and velocidade_vertical >= 0)
if (esta_no_chao)
{
	if (steps_restantes_buffer >0)
	{
		// Se tem buffer do pulo e encosta no chão, player faz o pulo
		scr_make_jump();
	}
	else
	{
		aceleracao = aceleracao_chao;
		estado = State_player.Normal;
		velocidade_vertical = 0;
		steps_restantes_coyote = coyote_time;
	}
}
else
{
	aceleracao = aceleracao_ar;
	estado = State_player.In_air;
}


#region Movimentação do personagem com WASD e Setas / input do pulo

		var _right_input = scr_get_input_hold("right");
		var _left_input = scr_get_input_hold("left");
		
		horizontal_input = _right_input - _left_input;

		var jump_input = scr_get_input("jump");
		 jump_hold_input = scr_get_input_hold("jump");

		var moveX = horizontal_input*move_speed_this_frame;
		
		velocidade_horizontal = lerp(velocidade_horizontal, moveX,aceleracao);
			
#endregion

switch estado {
	
	case State_player.Normal:		
		
		// Pula se estiver no chao
		if (jump_input and (esta_no_chao or steps_restantes_coyote >0))
		{
			scr_make_jump();
		}
		
	
	break;
	
	case State_player.In_air:
	
		// Buffer pulo (se apertar para pular antes de tocar no chão)		
		steps_restantes_buffer -= steps_restantes_buffer >0;		
		if (steps_restantes_buffer >0 and esta_no_chao)
		{
			scr_make_jump();
		}
		if (jump_input and steps_restantes_coyote <= 0) steps_restantes_buffer = buffer_time;
		
		
		// Coyote Time / Delay para pular antes de cair
		steps_restantes_coyote -= steps_restantes_coyote > 0;
		
		if (jump_input and steps_restantes_coyote >0)
		{
			scr_make_jump();
		}
		
		
		// Cortando a velocidade do pulo pela metade quando solta o botão
		
		
		if (velocidade_vertical < 0 and !jump_hold_input) cut_velocity = true;
		
		if (cut_velocity and velocidade_vertical <0 )	velocidade_vertical *= 0.5;
		else cut_velocity = false;
		
			
	// Se não estiver no chão, aplica gravidade
		velocidade_vertical += gravidade_this_frame;
		
		velocidade_vertical = clamp(velocidade_vertical, -max_velocidade_vertical*delta_factor, max_velocidade_vertical*delta_factor);
		
	break;
	
	
}

// Reseta o momentum
if ((momentum_left or momentum_right or momentum_up) and buffer_momentum)
{
	buffer_momentum--
}
else
{
	momentum_up = false;
	momentum_right = false;
	momentum_left = false;
	buffer_momentum = 20;
}

// Volta ao tamanho normal aos poucos
xscale = lerp(xscale,initial_xscale,0.15);
yscale = lerp(yscale,initial_yscale,0.15);
