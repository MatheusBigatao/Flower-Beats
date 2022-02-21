/// @description 



is_paused = false;
delay_option_counter = 0
delay_option = 10;

width = room_height;
height = room_height;

settings_ON = false;

var _reference_x = 3840;
var _reference_y = 2160;

pos_x_resume = 2688 /_reference_x;
pos_y_resume = 1280 /_reference_y;

pos_x_restart = 1632/ _reference_x;
pos_y_restart = 1280 /_reference_y;

pos_x_settings = 2166 / _reference_x;
pos_y_settings = 1280 / _reference_y;

pos_x_exit = 1152 /_reference_x;
pos_y_exit = 1280 /_reference_y;

hover = 3; // Começa em cima do botão de Resume
			// 0 para Exit
			// 1 para Restart
			// 2 para Settings
			// 3 para Resume

previous_mouse_x = device_mouse_x_to_gui(0);
previous_mouse_y = device_mouse_y_to_gui(0);