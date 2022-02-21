/// @description Insert description here
// You can write your code in this editor

//RGB
//BGR (forma que o gamemaker lê)

paleta_cores++

if (paleta_cores> total_paletas) paleta_cores = 1;

// altera a paleta de cores seguindo uma lista
scr_altera_paleta_cores(paleta_cores);

// atribui as cores ao backgroud e ao player
scr_altera_cor_player_e_background();