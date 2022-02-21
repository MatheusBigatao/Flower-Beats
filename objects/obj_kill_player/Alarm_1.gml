/// @description Se estiver dentro do View

if (!destroy_outside_view or follow !=noone) exit;

if(!scr_is_inside_view())
{
	deactivate_draw = true;
	// Fora do View é destruido e se for bullet
	if (is_moving) instance_destroy();	
}
else
{
	deactivate_draw = false;	
}

alarm[1] = 10;