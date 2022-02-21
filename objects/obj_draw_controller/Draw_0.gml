/// @description Insert description here
// You can write your code in this editor


var _color_walls = color_walls;
var _color_platforms = color_platforms
var _color_spike = player_white*c_white + !player_white*c_black;
var _player_white = player_white;



if (instance_exists(obj_kill_player))
{
	with(obj_kill_player)
	{
		draw_sprite_ext(spr_spike, image_index, x, y, xscale, yscale, image_angle, _color_spike, image_alpha );
	}
}

if (instance_exists(obj_row_kill_player))
{
	with(obj_row_kill_player)
	{
		scr_draw_row_kill_player(_color_spike)	
	}
}

if (instance_exists(obj_platform_star))
{
	with(obj_platform_star)
	{
		if (_player_white) var _image_index = 0;
		else				var _image_index = 1;
		
		draw_sprite_ext(spr_platform_star, _image_index, x, y, image_xscale, image_yscale, image_angle,c_white, image_alpha );
	}
}

//if (instance_exists(obj_checkpoint))
//{
//	with(obj_checkpoint)
//	{
//		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, _color_spike, image_alpha );	
//	}
//}

if (instance_exists(obj_player))
{
	with(obj_player)
	{
		if (_player_white) var _sprite = spr_player_back1;
		else				var _sprite = spr_player_back_black;
		draw_sprite_ext(_sprite, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha );

		//draw_set_color(c_black);
		//draw_set_font(fnt_debug);
		//draw_set_halign(fa_center);
		//if (debug) draw_text(x,y+10, "ON")
		//else draw_text(x,y+10, "OFF")	
	}
}

if (instance_exists(obj_player_triangle))
{
	with(obj_player_triangle)
	{
		if (_player_white) var _sprite =  spr_player_triangle;
		else				var _sprite = spr_player_triangle_black;

		draw_sprite_ext(_sprite,image_index,x,y, xscale, yscale, image_angle, obj_player.image_blend, image_alpha)	
	}
}


if (instance_exists(obj_wall_floor))
{
	with (obj_wall_floor)
	{
		//draw_sprite_ext(spr_wall_floor,0,x,y,image_xscale, image_yscale, image_angle, image_blend,image_alpha);
		draw_sprite_ext(spr_white_32,0,x,y,image_xscale, image_yscale, image_angle, _color_walls,image_alpha);
	}
}
// Desativando blend mode
gpu_set_blendenable(false);
gpu_set_alphatestenable(false);

/////////////////////////////////////////////////////////////////////
// >>>>>>>> APENAS OBJETOS QUE NÃO PRECISAM DE ALFA (OBJETOS QUADRADOS) <<<<<<<<<<<<<<

if (instance_exists(obj_plataform_moving_beat))
{
	with(obj_plataform_moving_beat)
	{
		//if (deactivate_draw) continue;

	//	draw_sprite_ext(spr_wall_moving_beat, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha );	
		draw_sprite_ext(spr_white_32_origin_center, 0, x, y, xscale, yscale, image_angle, _color_platforms, image_alpha );	
	}
}


if (instance_exists(obj_platform_retract))
{
	with(obj_platform_retract)
	{
		//if draw_deactivated continue;
		image_blend = _color_platforms;
		draw_self();	
	}
}

// Ativando blend mode
gpu_set_blendenable(true);
gpu_set_alphatestenable(true);




if (instance_exists(obj_plataform_beat))
{
	with (obj_plataform_beat)
	{
		draw_sprite_ext(initial_sprite,0,x,y,image_xscale, image_yscale, image_angle, _color_platforms, image_alpha);
	}
}


if (instance_exists(obj_shooter))
{
	with(obj_shooter)
	{
		draw_sprite_ext(spr_white_32_origin_center, 0, x, y, image_xscale, image_yscale, image_angle, _color_platforms, image_alpha );
		draw_sprite_ext(spr_white_32_origin_center, 1, x, y, image_xscale, image_yscale, direcao_bullet, _color_walls, image_alpha )
	}
}
