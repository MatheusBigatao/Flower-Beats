// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_draw_rectangle_width_colour(_x1, _y1, _x2, _y2, _line_width, _colour){
	/// draw_rectangle_width_colour(_x1, _y1, _x2, _y2, _rot, _line_width, _colour)

draw_set_color(_colour);
// top
draw_rectangle(_x1, _y1, _x2, _y1+_line_width, false);

//right
draw_rectangle(_x2-_line_width, _y1, _x2, _y2, false);

//bottom
draw_rectangle(_x1, _y2-_line_width, _x2, _y2, false);

//left
draw_rectangle(_x1, _y1, _x1+_line_width, _y2, false);

}