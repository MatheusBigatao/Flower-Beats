/// @description Adjust camera and Viewport

view_enabled = true;
view_visible[0] = true;

camera_set_view_size(view, camera_width, camera_height);
camera_set_view_pos(view, 0,0);	

if (instance_exists(obj_player))
{
	var _x = clamp(obj_player.x - camera_width/2, 0, room_width-camera_width);
	var _y = clamp( obj_player.y - camera_height/2, 0, room_height -camera_height);
	camera_set_view_pos(view, _x,_y);
	
}

