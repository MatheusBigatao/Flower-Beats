/// @description Insert description here
// You can write your code in this editor

// No menu inicial não roda esse script
if (room == rm_initial) exit;


if (paleta_cores ==0)
{
	scr_altera_paleta_cores(paleta_cores);	
}

var _id_background = layer_background_get_id("Background");
var _id_background_2 = layer_background_get_id("Backgrounds_1");
layer_background_blend(_id_background, color_background);
layer_background_blend(_id_background_2, color_background_2);

// Altera o chuvisco do fundo da tela
var _number_subimages = sprite_get_number(spr_background);
var _index = irandom(_number_subimages);
layer_background_index(_id_background_2, _index);
layer_background_visible(_id_background_2, have_rain_background);

// Parâmetros para fazer o background
width_background = max (3840*0.8 , room_width * 0.8);
height_background = max (2160*0.8, room_height * 0.8);

//// Escolhendo as posições aleatóriamente das imagens do background
//ds_list_shuffle(lista_posicoes);
//ds_list_shuffle(lista_posicoes2);

//var _i = 0;
//repeat (array_length(array_tipos_background))
//{
//	array_tipos_background[_i] = choose(0,1,2,3); //Escolha entre as 4 subimagens de spr_item_background	
//}