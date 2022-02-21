/// @description Insert description here
// You can write your code in this editor

if (follow !=noone)
{
	x = follow.x +offset_x;
	y = follow.y +offset_y;
}

if (global.beat_now)	xscale *= escala_estica;


xscale = lerp(xscale,initial_xscale,0.15);
//yscale = lerp(yscale,initial_yscale,0.15);

if (is_moving)
{
	x += velocidade_x*global.delta_factor;
	y += velocidade_y*global.delta_factor;
}