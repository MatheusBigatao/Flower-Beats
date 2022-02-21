/// @description Insert description here
// You can write your code in this editor

var _player_hitted = collision_rectangle(collision_rectangle_coord[1],collision_rectangle_coord[2], collision_rectangle_coord[3], collision_rectangle_coord[4], obj_player, false, true);
		if (_player_hitted != noone)
		{
			scr_player_get_killed();	
		}
		
alarm[0] = 2;