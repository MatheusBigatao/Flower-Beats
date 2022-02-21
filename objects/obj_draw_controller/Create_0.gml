/// @description Insert description here
// You can write your code in this editor

randomize();
//RGB
//BGR (forma que o gamemaker lê)

color_background = $d4eff8;
color_background_2 = $3d6edf;
player_white = false;
color_walls = $6344de;
color_platforms = $521782;

paleta_cores = 0; // Inicializa com paleta de cores aleatória

total_paletas = 13;


is_daltonico = false;
have_rain_background = true;


width_background = max (3840*2/3 , room_width * 0.5);
height_background = max (2160*2/3, room_height * 0.5);
