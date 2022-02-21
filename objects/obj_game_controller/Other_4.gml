/// @description Insert description here
// You can write your code in this editor


switch room
{
	case rm_splash:
		alarm[0] = 2; // Vai para rm_initial
	break;
	
	case rm_initial:
	// Cria o obj_camera na tela inicial
		if (!instance_exists(obj_camera))
		{
			instance_create_layer(x,y,"Controller", obj_camera);
		}
	
	break;
}




// Coloca o triangulo no player no inicio da fase (apenas na fase zero que começa sem triangulo)
if (room == rm_level0)
{
	global.have_triangle = false;
	if (instance_exists(obj_player_triangle))
	{
		with(obj_player_triangle)
		{
			instance_destroy();	
		}
	}
}
else
{
	global.have_triangle = true;	
}


// Checkpoint inicial
if (instance_exists(obj_player))
{
	// Variaveis para checkpoint
	global.checkpoint = 0;
	global.coord_checkpoint[1] = obj_player.x;
	global.coord_checkpoint[2] = obj_player.y;
	
}


instance_existe_na_room[0][0] = obj_wall_floor;
instance_existe_na_room[1][0] = obj_kill_player;
instance_existe_na_room[2][0] = obj_plataform_beat;
instance_existe_na_room[3][0] = obj_row_kill_player;

instance_existe_na_room[0][1] = instance_exists(obj_wall_floor);
instance_existe_na_room[1][1] = instance_exists(obj_kill_player);
instance_existe_na_room[2][1] = instance_exists(obj_plataform_beat);
instance_existe_na_room[3][1] = instance_exists(obj_row_kill_player);


if (room == rm_initial) window_set_cursor(cr_default)
else					window_set_cursor(cr_none);
