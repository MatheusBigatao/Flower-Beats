// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_is_between(_value,limit_1,limit_2){

	if (limit_1 >= limit_2)
	{
		return _value <=limit_1 and _value >= limit_2;	
	}
	else
	{
		return _value <=limit_2 and _value >= limit_1;		
	}
}