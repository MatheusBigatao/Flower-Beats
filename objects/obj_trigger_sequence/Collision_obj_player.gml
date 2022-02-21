/// @description Insert description here
// You can write your code in this editor

switch sequence
{
	
	case sqc_square:
		if (instance_exists(obj_square))
		{
			with (obj_square)
			{
				var _x = x;
				var _y = y;
			}
			
		}
		
		var _layer_name = "Animation";

		layer_sequence_create(_layer_name, _x, _y, sequence);
		
		with (obj_square)
			{
				instance_destroy();
			}

		break;
		
	case sqc_circle:
		if (instance_exists(obj_circle))
		{
			with (obj_circle)
			{
				var _x = x;
				var _y = y;
			}
			
		}
		
		var _layer_name = "Animation";

		layer_sequence_create(_layer_name, _x, _y, sequence);

		with(obj_circle)
		{
			instance_destroy();	
		}
		break;

	case sqc_triangle:
		if (instance_exists(obj_triangle))
		{
			with (obj_triangle)
			{
				var _x = x;
				var _y = y;
			}
			
		}
		
		var _layer_name = "Animation";

		layer_sequence_create(_layer_name, _x, _y, sequence);

		with(obj_triangle)
		{
			instance_destroy();	
		}
		break;
		
// Fusao com o triangulo
	case sqc_fusion_triangle:
	
			with (obj_player)
			{
				can_walk = false;	
			}
			var _x = 10248;
			var _y = 1384;
		
			var _layer_name = "Animation";
			
			layer_sequence_create(_layer_name, _x, _y, sequence);
			
			var _layer_id = layer_get_id("Triangle");
			layer_destroy(_layer_id);
			
			var _sfx_fusion = audio_play_sound(snd_fusion_triangle,150,false);
			audio_sound_set_track_position(_sfx_fusion,8.5);
			
}

instance_destroy();