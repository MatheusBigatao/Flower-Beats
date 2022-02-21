// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
global.list_deactivated_instances = ds_list_create();

function scr_deactivate_outside_view(_obj_index){
	var _offset_camera_x = 300;
	var _offset_camera_y = 200;
	var _left_camera = global.left_border_camera - _offset_camera_x;
	var _right_camera = global.right_border_camera + _offset_camera_x;
	var _top_camera = global.top_border_camera - _offset_camera_y;
	var _bottom_camera = global.bottom_border_camera + _offset_camera_y;
	
	with (_obj_index)
	{
		if (!deactivatable) exit;
		
		var _horiz_offset = 50;
		var _vert_offset = 50;
		var _bbox_left = x - sprite_xoffset - _horiz_offset;
		var _bbox_right = _bbox_left + sprite_width + (_horiz_offset*2);
		var _bbox_top = y - sprite_yoffset - _vert_offset;
		var _bbox_bottom = _bbox_top + sprite_height + (_vert_offset*2);
			
		//// Checa se algumas das diagonais está na área
		//cull = (scr_is_between(_bbox_left, _right_camera, _left_camera)
		//		and scr_is_between(_bbox_bottom, _top_camera, _bottom_camera))
		//		or (scr_is_between(_bbox_left, _right_camera, _left_camera)
		//		and scr_is_between(_bbox_top, _top_camera, _bottom_camera))
		//		or (scr_is_between(_bbox_right, _right_camera, _left_camera)
		//		and scr_is_between(_bbox_bottom, _top_camera, _bottom_camera))
		//		or (scr_is_between(_bbox_left, _right_camera, _left_camera)
		//		and scr_is_between(_bbox_top, _top_camera, _bottom_camera))
		
		//var _cull = !(( _bbox_left < _right_camera)
		//				and (_bbox_right > _left_camera)
		//				and (_bbox_top < _bottom_camera)
		//				and (_bbox_bottom > _top_camera));
						
		var _cull = !rectangle_in_rectangle(_bbox_left,_bbox_top,_bbox_right, _bbox_bottom, _left_camera, _top_camera, _right_camera, _bottom_camera );
		
		
		if (_cull)
		{
			instance_deactivate_object(id);
			ds_list_add(global.list_deactivated_instances, [id, _bbox_left, _bbox_top, _bbox_right, _bbox_bottom]);
		}
	}
}