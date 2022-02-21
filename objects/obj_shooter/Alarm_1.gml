/// @description Se estiver dentro do view

if (shoot_outside_view)
{
	stop_shooting = false;
	exit;
}

// Para de atirar se estiver fora do View
if (scr_is_inside_view())
{
	stop_shooting = false;
}
else
{
	stop_shooting = true;
}

alarm[1] = 10;

