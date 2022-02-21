// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_get_input_hold(_input_string){
	
	switch _input_string{
		
		case "right":
			if (gamepad_is_connected(0))
			{
				var _input = max (gamepad_axis_value(0,gp_axislh),0) or gamepad_button_check(0,gp_padr);
			}
			else
			{
				var _input = keyboard_check(vk_right) or keyboard_check(ord("D"))
			}
		break;
		
		case "left":
			if (gamepad_is_connected(0))
			{
				var _input = abs(min(gamepad_axis_value(0,gp_axislh),0)) or gamepad_button_check(0,gp_padl);
			}
			else
			{
				var _input = keyboard_check(vk_left) or keyboard_check(ord("A"))
			}
		break;
		
		case "up":
			if (gamepad_is_connected(0))
			{
				var _input = (gamepad_axis_value(0,gp_axislv) < -0.4) or gamepad_button_check(0,gp_padu);
			}
			else
			{
				var _input = keyboard_check(vk_up) or keyboard_check(ord("W"))
			}
		break;
		
		case "down":
			if (gamepad_is_connected(0))
			{
				var _input = (gamepad_axis_value(0,gp_axislv) > 0.4) or gamepad_button_check(0,gp_padd);
			}
			else
			{
				var _input = keyboard_check(vk_down) or keyboard_check(ord("S"))
			}
		break;
		
		case "jump":
			if (gamepad_is_connected(0))
			{
				var _input = gamepad_button_check(0,gp_face1);
			}
			else
			{
				var _input = keyboard_check(vk_up) or keyboard_check(ord("W")) or keyboard_check(vk_space);
			}
		
		break;
		
		case "select_option":
			if (gamepad_is_connected(0))
			{
				var _input = gamepad_button_check(0,gp_face1);
			}
			else
			{
				var _input = keyboard_check(vk_space) or keyboard_check(vk_enter);
			}
	}
	return _input;

}