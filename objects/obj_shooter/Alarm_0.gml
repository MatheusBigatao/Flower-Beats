/// @description Shoot a bullet

if (stop_shooting) exit;


var bullet = instance_create_layer(x,y,layer, obj_kill_player)
var _direcao = direcao_bullet;
var _velocidade_bullet = velocidade_bullet;
var _destroy_outside_view = !shoot_outside_view 

with (bullet)
{
	deactivatable = false;
	direcao = _direcao;
	is_moving = true;
	image_angle = _direcao;
	velocidade = _velocidade_bullet;
	//depth += 50;
	destroy_outside_view = _destroy_outside_view;	
}

//alarm[0] = tempo_seg_shoot*room_speed;