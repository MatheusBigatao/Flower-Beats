/// @description Insert description here
// You can write your code in this editor

#macro hover_credits 4
#macro hover_start 3
#macro hover_settings 2
#macro hover_exit 1

if (room == rm_initial)
{
	select_level_active = false;
	credits_active = false;
	instance_deactivate_layer("Select_level");
	instance_deactivate_layer("Credits");	
}
// Variaveis do Menu inicial
select_level_active = false;
credits_active = false;
settings_ON = false;
actual_option_menu = hover_start;

options_select_level = 9;
actual_option_select_level = 1;


// Parâmetros para selecionar opção no Menu inicial
mouse_previous_x = device_mouse_x(0);
mouse_previous_y = device_mouse_y(0);
select_with_mouse = false;


delay_option_counter = -1;
delay_option = 10;