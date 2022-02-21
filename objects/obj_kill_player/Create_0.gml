/// @description Insert description here
// You can write your code in this editor

//follow = noone;
deactivatable = true;

if (follow != noone or is_moving)
deactivatable = false;

//is_moving = false;
//direcao = Direcao_cardial.Oeste;
//velocidade = 2;
velocidade_x = 0;
velocidade_y = 0;
//destroy_outside_view = true;

deactivate_draw = false;
alarm[0] = 1;
alarm[1] = 1;

xscale = image_xscale;
yscale = image_yscale;

initial_xscale = xscale;
initial_yscale = yscale;

escala_estica = 1.9;

