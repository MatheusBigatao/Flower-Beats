/// @description Atira no BEAT

if (global.beat_now)
{
	if (shoot_next_beat) 
	{
		alarm[0] = 1;
		if (!always_shoot_on_beat)
			shoot_next_beat = false;
	}
	else shoot_next_beat = true;
}