/// @description Insert description here
// You can write your code in this editor

if (follow_platform_retract_id != noone)
{
	switch follow_corner
	{
		case Direcao_cardial.Norte:
			var _x =follow_platform_retract_id.up_corner[0];
			var _y =follow_platform_retract_id.up_corner[1];
		break;
		
		case Direcao_cardial.Leste:
			var _x =follow_platform_retract_id.right_corner[0];
			var _y =follow_platform_retract_id.right_corner[1];
		break;
		
		case Direcao_cardial.Oeste:
			var _x =follow_platform_retract_id.left_corner[0];
			var _y =follow_platform_retract_id.left_corner[1];
		break;
		
		case Direcao_cardial.Sul:
			var _x =follow_platform_retract_id.down_corner[0];
			var _y =follow_platform_retract_id.down_corner[1];
		break;
	}
	
	x = _x;
	y = _y;
}