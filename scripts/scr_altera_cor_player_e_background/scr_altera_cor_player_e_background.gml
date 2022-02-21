// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_altera_cor_player_e_background(){
		var _id_background = layer_background_get_id("Background");
		var _id_background_2 = layer_background_get_id("Backgrounds_1");
		layer_background_blend(_id_background, color_background);
		layer_background_blend(_id_background_2, color_background_2);
		

		
		//if (instance_exists(obj_player))
		//{
		//	if (player_white) 
		//	{
		//		var _sprite_index = spr_player_back1;
		//		var _sprite_triangle = spr_player_triangle;
		//	}
		//	else
		//	{
		//		var _sprite_index = spr_player_back_black;
		//		var _sprite_triangle = spr_player_triangle_black;
		//	}
		
		//	obj_player.sprite_index					= _sprite_index;
		//	obj_player_triangle.sprite_index		= _sprite_triangle;
		//}
		
}