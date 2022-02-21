/// @description 

view_width = 1280;
view_height = 720;

camera_width = 3840;
camera_height = 2160;

window_set_size(view_width, view_height);
alarm[0] = 1;

#macro view view_camera[0]

	window_set_fullscreen(true);
	var _width = camera_get_view_width(view_camera[0]);
	var _height = camera_get_view_height(view_camera[0]);
	
		window_set_size(_width,_height);
	surface_resize(application_surface, _width, _height)
	
magnitude = 0;
tempo_screen_shake = 0;

ref_x = camera_get_view_x(view);
ref_y = camera_get_view_y(view);