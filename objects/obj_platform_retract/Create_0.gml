/// @description Insert description here
// You can write your code in this editor

sprite_index = spr_white_32_origin_up_left;
// Posicoes de cada canto
left_corner[0] = x;
left_corner[1] = y+sprite_height/2;

right_corner[0] = x+sprite_width;
right_corner[1] = y+sprite_height/2;

up_corner[0] = x + sprite_width/2;
up_corner[1] = y;

down_corner[0] = x + sprite_width/2;
down_corner[1] = y+sprite_height;

////Define se vai mudar a escala na vertical e/ou horizontal
//change_vertical = false;
//change_horizontal = false;

//// Para qual escala que ele vai contrair ou esticar
//escala_contracao_x = 0.5;
//escala_esticado_x = 2;

//escala_contracao_y = 0.5;
//escala_esticado_y = 2;

//contract_next_beat = false;

initial_veloc_contracao = velocidade_contracao;

//initial_xscale = image_xscale;
//initial_yscale = image_yscale;


referencia_contract_next_beat = contract_next_beat;
referencia_beat_ON = global.state_beat_ON;

deactivatable = true;
//alarm[3] = 1; //Setando as variaveis de Variables Deinitions