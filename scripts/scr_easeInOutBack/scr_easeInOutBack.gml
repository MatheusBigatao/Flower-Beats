/// scr_easeInOutBack(_x)
function scr_easeInOutBack(argument0) {


	var c1 = 1.70158;
	var c2 = c1 * 1.525;
	var _x = argument0;

	if (_x < 0.5)
	{
		return (power(2 * _x, 2) * ((c2 + 1) * 2 * _x - c2)) / 2;
	}
	else
	{
		return (power(2 * _x - 2, 2) * ((c2 + 1) * (_x * 2 - 2) + c2) + 2) / 2;
	}


}
