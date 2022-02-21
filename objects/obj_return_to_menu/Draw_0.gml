/// @description Insert description here
// You can write your code in this editor

draw_self();
	
	var _offset = 30;
	var _x1 = x - sprite_xoffset - _offset;
	var _y1 = y - sprite_yoffset ;
	var _x2 = _x1 + sprite_width + 2*_offset;
	var _y2 = _y1 + sprite_height;
	
	draw_set_color(c_white);
	draw_set_alpha(0.2);
	draw_roundrect_ext(_x1,_y1,_x2,_y2, 100, 100, false); // Contorno da região interagível
	draw_set_alpha(1.0);