// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_draw_row_kill_player(_color_spike){
	
//	// Cor do spike / preto ou branco
//if (obj_draw_controller.player_white) var _color_spike = c_white;
//else									var _color_spike = c_black;

// DEBUG
//draw_set_color(c_red)
//draw_rectangle(collision_rectangle_coord[1],collision_rectangle_coord[2], collision_rectangle_coord[3], collision_rectangle_coord[4], false)


switch (spike_na_direcao)
{
	case Direcao_cardial.Leste:
		for (var _i = 0; _i <= numero_spikes; _i++)
		{
			var _origem_y = bbox_top;
			var _origem_x = bbox_left;
			var _angle = 0;
			var posicao_spike_y = _origem_y + largura_spike*(_i-1) + largura_spike;
			draw_sprite_ext(spr_spike, 0, _origem_x, posicao_spike_y, xscale, yscale, _angle, _color_spike, image_alpha );
		}
	break;
	
	case Direcao_cardial.Oeste:
		for (var _i = 0; _i <= numero_spikes; _i++)
		{
			var _origem_y = bbox_top;
			var _origem_x = bbox_right;
			var _angle = 180;
			var posicao_spike_y = _origem_y + largura_spike*(_i-1) + largura_spike;
			draw_sprite_ext(spr_spike, 0, _origem_x, posicao_spike_y, xscale, yscale, _angle, _color_spike, image_alpha );
		}
	break;
	

	case Direcao_cardial.Sul:
		for (var _i = 0; _i <= numero_spikes; _i++)
		{
			var _origem_y = bbox_top;
			var _origem_x = bbox_left;
			var _angle = 270;
			var posicao_spike_x = _origem_x + largura_spike*(_i-1) + largura_spike;
			draw_sprite_ext(spr_spike, 0, posicao_spike_x, _origem_y, xscale, yscale, _angle, _color_spike, image_alpha );
		}
	break;
	
	case Direcao_cardial.Norte:
		for (var _i = 0; _i <= numero_spikes; _i++)
		{
			var _origem_y = bbox_bottom;
			var _origem_x = bbox_left;
			var _angle = 90;
			var posicao_spike_x = _origem_x + largura_spike*(_i-1) + largura_spike;
			draw_sprite_ext(spr_spike, 0, posicao_spike_x, _origem_y, xscale, yscale, _angle, _color_spike, image_alpha );
		}
	break;
}

}