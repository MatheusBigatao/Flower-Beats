// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_activate_inside_view(){
	
	var _offset_camera_x = 200;
	var _offset_camera_y = 300;
	var _left_camera = global.left_border_camera - _offset_camera_x;
	var _right_camera = global.right_border_camera + _offset_camera_x;
	var _top_camera = global.top_border_camera - _offset_camera_y;
	var _bottom_camera = global.bottom_border_camera + _offset_camera_y;
	
	
	var i = 0;
	repeat( ds_list_size(global.list_deactivated_instances))
	{
		var _inst = global.list_deactivated_instances[|i];
		//var _cull = !(( _inst[1] < _right_camera)
		//				and ( _inst[2] < _bottom_camera)
		//				and ( _inst[3] > _left_camera)
		//				and ( _inst[4] > _top_camera));
		
		var _cull = !rectangle_in_rectangle(_inst[1],_inst[2],_inst[3], _inst[4], _left_camera, _top_camera, _right_camera, _bottom_camera );
		
		
		if (!_cull)
		{
			instance_activate_object(_inst[0]);
			ds_list_delete(global.list_deactivated_instances, i--);
		}
		++i;
	}
}