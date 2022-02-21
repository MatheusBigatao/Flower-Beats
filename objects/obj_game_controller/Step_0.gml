/// @description Insert description here
// You can write your code in this editor

switch action{
	
	// Desativa objetos fora do View e add a lista
	case 5:
		var _i = 0;
		repeat (array_length(instance_existe_na_room))
		{
			if (instance_existe_na_room	[_i][1])
			{
				var _obj_index = instance_existe_na_room[_i][0];
				scr_deactivate_outside_view(_obj_index);
			}
			_i++;
		}
	
	// Ativa os objetos da lista que estão no View
	case 3:
		scr_activate_inside_view();
		break;
}

action++

if (action > 5) action = 1;


#region Transição de rooms
if (run_transition)
{
	number_sprite_horizontal = display_get_gui_width() div (_sprite_width*_scale_multiplier) + 1;
	number_sprite_vertical = display_get_gui_height() div (_sprite_height*_scale_multiplier) + 1;
	
	switch estado_trasicao
	{
		case "saindo_room":
		if (_image_index_transition < _image_index_transition_max + number_sprite_horizontal)
		{
			_image_index_transition += image_index_increment;	
		}
		else
		{
			estado_trasicao = "entrando_room";
			if (room_exists(target_room)) room_goto(target_room);	
		}
		break;
		
		case "entrando_room":
			if (_image_index_transition > 0)
			{
				_image_index_transition -= image_index_increment;	
			}
			else
			{
				run_transition = false;	
			}
		break;
	}
}
#endregion

