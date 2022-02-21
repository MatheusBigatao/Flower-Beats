// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_make_jump(){
				// Dá velocidade do pulo / Adiciona momentum do obj_platform_moving
			velocidade_vertical = -altura_pulo -momentum_up*bonus_jump_momentum;
			debug_jump = velocidade_vertical;
			if (velocidade_horizontal !=0) velocidade_horizontal += (momentum_right - momentum_left)*bonus_horizontal_momentum;
				
			// Deformação ao pular
			xscale = initial_xscale;
			yscale = initial_yscale;
			
			xscale *= comprime_escala;
			yscale *= estica_escala;
			
			steps_restantes_coyote = 0;
			steps_restantes_buffer = 0;
			estado = State_player.In_air;
}