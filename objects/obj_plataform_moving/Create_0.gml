/// @description Insert description here
// You can write your code in this editor

sprite_index = -1;


velocidade_plataforma = 2;

x_initial = x;
y_initial = y;

direcao = point_direction(x_initial, y_initial, x_final, y_final);

moveX = 0;
moveY = 0;

// Define qual são os limites mínimos e máximos
if (x_initial < x_final)
{
	x_min = x_initial;
	x_max = x_final;
}
else
{
	x_min = x_final;
	x_max = x_initial;
}

if (y_initial < y_final)
{
	y_min = y_initial;
	y_max = y_final;
}
else
{
	y_min = y_final;
	y_max = y_initial;
}