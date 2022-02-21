/// @description Insert description here
// You can write your code in this editor

deactivatable = true;

escala_estica = 1.9;
xscale = 1;
yscale = 1;

initial_xscale = 1;

largura_spike = sprite_get_height(spr_spike_unuse);

if (sprite_height > sprite_width) numero_spikes = floor(sprite_height/ largura_spike);
else							numero_spikes = floor(sprite_width/ largura_spike);


alarm[1] = 1 // Setando os parâmetros de Variables

alarm[0] = 3;