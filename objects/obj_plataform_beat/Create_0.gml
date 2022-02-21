/// @description Insert description here
// You can write your code in this editor

//is_touchable = true;
sprite_index = spr_white_64;

initial_sprite = sprite_index;


// Retângulo que checa colisão com player para matá-lo no BEAT
// Referência do sprite é no Top Centro
collision_rectangle_coord[4] = 0;
var offset_x_rectangle = 15;
var offset_y_rectangle = 15;

collision_rectangle_coord[1] = x - sprite_width/2 +offset_x_rectangle;
collision_rectangle_coord[2] = y  + offset_y_rectangle;
collision_rectangle_coord[3] = x + sprite_width/2 -offset_x_rectangle;
collision_rectangle_coord[4] = y + sprite_height -offset_y_rectangle;

sprite_index = -1;

deactivate_draw = false;
alpha = 0.3;

//position_one_x = x;
//position_one_y = y;


// Inicia colocando a mascara para colisao se o obj é tocável
mask_index = initial_sprite *is_touchable -1 * !is_touchable;

deactivatable = true;
alarm[0] = 1;


