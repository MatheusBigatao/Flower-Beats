/// @description Insert description here
// You can write your code in this editor

// Altera o estado atual no beat
if (global.state_beat_ON == referencia_beat_ON)
{
	is_touchable = referencia;
}
else
{
	is_touchable = !referencia;	
}

// Faz a plataforma ser tocável
if (is_touchable)
	{
		mask_index = initial_sprite;
	}
	else
	{
		mask_index = -1;
	}

// Se o player estiver dentro da plataforma no BEAT, ele morre
if (global.beat_now)
{

	if (is_touchable)
	{
		// Se o player estiver dentro da plataforma quando ela se torna tocável, ele morre
		var _player_hitted = collision_rectangle(collision_rectangle_coord[1],collision_rectangle_coord[2], collision_rectangle_coord[3], collision_rectangle_coord[4], obj_player, false, true);
		if (_player_hitted != noone)
		{
			scr_player_get_killed();	
		}
	}
	
}


// Deixa a plataforma semi transparente quando não pode ser tocada
image_alpha = alpha * !is_touchable + is_touchable;


