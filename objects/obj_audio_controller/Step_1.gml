/// @description

//global.delta_factor = scr_get_delta_factor();

var delta = global.delta_factor;

// Alarmes com delta time
for (var i=0; i<array_length_1d(Alarm); i++)
{
	//Reduce time delta
	if (Alarm[i] > 0)
	{
		Alarm[i] -= delta;
	}	
	// Run Alarm
	else if (Alarm[i] <= 0 and Alarm[i] > ALARM_INACTIVATE)
	{
		Alarm[i] = ALARM_INACTIVATE;
		event_perform(ev_alarm, i);
	}
	

}