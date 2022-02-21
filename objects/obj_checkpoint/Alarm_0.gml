/// @description Check collision with player

if (touched) exit;

var _x1 = x-100;
var _y1 = y;
var _x2 = x+100;
var _y2 = y-350;

if (collision_rectangle(_x1,_y1,_x2,_y2, obj_player,false,false))
{
	touched = true;
	 _order_checkpoint = order_checkpoint
	
	if (global.checkpoint < _order_checkpoint)
	{
		global.checkpoint = _order_checkpoint;
		global.coord_checkpoint[1] = x;
		global.coord_checkpoint[2] = y;
	}
	
	//sprite_index = spr_checkpoint_reached;
}

alarm[0] = 10;