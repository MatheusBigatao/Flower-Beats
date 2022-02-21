/// @description Insert description here
// You can write your code in this editor

sprite_index = -1;
mask_index = spr_wall_moving_beat;


//alarm[1] = 1;
//velocidade_plataforma = 20;

x_initial = x;
y_initial = y;

if (!move_in_horizontal) x_final = x_initial; // se não se move na horizontal
if (!move_in_vertical)	y_final  = y_initial; // se não se move na vertical

direcao_inicial_a_final = point_direction(x_initial, y_initial, x_final, y_final);
direcao = direcao_inicial_a_final;

alarm[0] = 1 // Setando os parâmetros de Variables Definitions

chegou_ao_destino = false;
is_in_position_one = true;
is_moving = false;

// Escala da plataforma 
initial_xscale = image_xscale;
initial_yscale = image_yscale;

xscale = initial_xscale;
yscale = initial_yscale;

//estica_escala = 1.5;
//comprime_escala = 0.6;

ativar_animacao = true;
