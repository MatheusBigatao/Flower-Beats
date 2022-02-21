/// @description Parâmetros para seguir ou se mover

if (follow != noone)
{
	offset_x = x - follow.x;
	offset_y = y - follow.y;
}




if is_moving
{
	velocidade_x = lengthdir_x(velocidade, direcao);
	velocidade_y = lengthdir_y(velocidade, direcao);
	//speed = velocidade;
	//direction = direcao;
	image_angle = direcao;
}
