/// @description Follow Player

camera_set_view_size(view, camera_width, camera_height);

var _x = camera_get_view_x(view);
var _y = camera_get_view_y(view);
var speed_camera = 1/40;

if (instance_exists(obj_player))
{
	// Leva a câmera até o personagem / Deixa o personagem no canto (horizontal) da tela para ver melhor
	// para onde está andando
	
	var _pos_player_x = obj_player.x - camera_width/2;
	var _pos_player_y = obj_player.y - camera_height/2;
	
	//var _offset_x = 0;
	//var _offset_y = 400;
	
	//var _FOV_x1 = global.left_border_camera + _offset_x;
	//var _FOV_y1 = global.top_border_camera;
	//var _FOV_x2 = global.right_border_camera - _offset_x;
	//var _FOV_y2 = global.bottom_border_camera - _offset_y
	//var _inside_FOV = collision_rectangle(_FOV_x1, _FOV_y1, _FOV_x2, _FOV_y2, obj_player, false,false);
	
	//if (!_inside_FOV) speed_camera *=2;
	if (global.bottom_border_camera-400<obj_player.y) speed_camera*=2.0;
	
	_x += (_pos_player_x - _x)*speed_camera;
	
	_y += (_pos_player_y - _y)*speed_camera;

	_x = clamp( _x, 0, room_width-camera_width);
	_y = clamp( _y, 0, room_height -camera_height);
	camera_set_view_pos(view, _x,_y);
	
	ref_x = _x;
	ref_y = _y;
}

if (tempo_screen_shake > 0)
{
	var _x = ref_x + irandom_range(-magnitude, magnitude);
	var _y = ref_y + irandom_range(-magnitude, magnitude);
	camera_set_view_pos(view, _x,_y);
	
}
else if (room != rm_initial)
{
	camera_set_view_pos(view, ref_x, ref_y);	
}
tempo_screen_shake -= tempo_screen_shake >0;

global.left_border_camera = _x;
global.right_border_camera = _x + camera_width;
global.top_border_camera = _y;
global.bottom_border_camera = _y + camera_height;