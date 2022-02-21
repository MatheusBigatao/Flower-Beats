/// @description Transição
if (run_transition)
{

	var _sub_image = 0;
	for (var yy = 0; yy < number_sprite_vertical; ++yy) {
     
		 for (var xx = 0; xx < number_sprite_horizontal; ++xx)
		 {
			_sub_image = min( max(0, _image_index_transition - (number_sprite_horizontal - xx)) , _image_index_transition_max -1) ;
			draw_sprite_ext(_sprite, _sub_image , xx*_sprite_width, yy*_sprite_height, _scale_multiplier, _scale_multiplier, 0, _color, 1 );
		 }
	 }
}