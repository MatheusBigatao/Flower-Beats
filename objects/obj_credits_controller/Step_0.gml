/// @description Insert description here
// You can write your code in this editor

var _step_down = 3;
if (scr_get_input_hold("down")) _step_down = 8;
y -= _step_down;


if (y<=(0-height_string))
{
	y = room_height + 50;	
}
