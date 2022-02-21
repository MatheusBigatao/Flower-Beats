/// @description Insert description here
// You can write your code in this editor


previous_mouse_x = device_mouse_x_to_gui(0);
previous_mouse_y = device_mouse_y_to_gui(0);

delay_option_counter = 0;
delay_option = 10;
	
// Cores para demontrar como ficará
instance_activate_object(obj_draw_controller);
with (obj_draw_controller)
{
	var _color_background = color_background;
	var _color_background_2 = color_background_2;
	var _color_platforms = color_platforms;
	var _color_walls	= color_walls;
	var _player_white	= player_white;
	var _have_rain_background = have_rain_background;
}

color_background = _color_background
color_background_2 = _color_background_2;
player_white = _player_white;
color_walls = _color_walls;
color_platforms = _color_platforms;
have_rain_background = _have_rain_background;

instance_deactivate_object(obj_draw_controller);
// GUI
distancia_entre_item_y = 220;
width_option = 600;
offset_width_option_rectangle = 440;
offset_entre_item_y = 50;
distancia_entre_change_options = 250;

left_rec = 1194;
right_rec = 2516;
top_rec = 316;
bottom_rec = 1770;


left_rec_show = 2700;
right_rec_show = 3400;
top_rec_show =  756;
bottom_rec_show = 1404;

// List
lista_opcoes = ds_list_create();

// Hover
hover_id = 0;


#region Opcoes para o jogador selecionar

// Valores da Resolução

instance_activate_object(obj_camera);
var _window_width = obj_camera.view_width;
instance_deactivate_object(obj_camera);

switch _window_width 
{
	case 1920:
	var _resolucao = 2;
	break;
	
	case 1280:
	var _resolucao = 1;
	break;
	
	case 960:
	var _resolucao = 0;
	break;
}

// Valores de Fullscreen ou modo janela
if (window_get_fullscreen()) var _fullscreen = 0;
else						var _fullscreen = 1;

// Valores da paleta de cores
instance_activate_object(obj_draw_controller);
var _total_paletas = obj_draw_controller.total_paletas;

var _paleta_cores = obj_draw_controller.paleta_cores;

paletas[0] = "?";
// Atribuindo os valores a Lista de Opções em formato de string (Ex: ["Random", "1", "2", "3", ...] )
for (var _i = 1; _i<=_total_paletas; _i++)
{
	paletas[_i] = string(_i);	
}


// Valores de modo daltonico
if (obj_draw_controller.have_rain_background ) var _have_rain_background = 0;
else								var _have_rain_background = 1;

instance_deactivate_object(obj_draw_controller);



// Adicionando a lista as opções disponíveis
ds_list_add(lista_opcoes, ["Volume", audio_get_master_gain(0)*10, ["0%", "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "100%"] ]);
ds_list_add(lista_opcoes, ["Resolucao",_resolucao, ["960x540", "1280x720", "1920x1080"] ]);
ds_list_add(lista_opcoes, ["Fullscreen", _fullscreen, ["ON", "OFF"]]);
ds_list_add(lista_opcoes, ["Paleta_cores", _paleta_cores, paletas]);
ds_list_add(lista_opcoes, ["Chuvisco", _have_rain_background, ["ON", "OFF"] ]);
ds_list_add(lista_opcoes, ["Close", -1, [] ]);


#endregion