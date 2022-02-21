/// @description Insert description here
// You can write your code in this editor

if (gamepad_is_connected(0))
{
	if (!layer_get_visible("Instruction_gamepad"))
	{
		layer_set_visible("Instruction_keyboard", false);
		layer_set_visible("Instruction_gamepad", true);
	}
}
else
{
	if (!layer_get_visible("Instruction_keyboard")) 
	{
		layer_set_visible("Instruction_gamepad", false);
		layer_set_visible("Instruction_keyboard", true);
	}
}


switch room
{
	// Seleciona a opção com o controle ou keyboard no Menu inicial
	case rm_initial:
	
		
		// Menu Inicial
		if (!select_level_active and !credits_active and !settings_ON)
		{
			scr_select_options_menu();
		}
		// Créditos
		if (credits_active)
		{
			// Retorna ao menu se dar algum Input
			scr_credits_to_menu();
		}
		if (select_level_active)
		{
			scr_select_level_to_menu();
		}
	break;
}