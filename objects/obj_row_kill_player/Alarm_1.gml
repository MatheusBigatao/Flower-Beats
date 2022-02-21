/// @description Insert description here
// You can write your code in this editor

// Coordenadas do retalgulo que irá checar colisao com player
collision_rectangle_coord[4] = 0;
var offset = 30;



switch (spike_na_direcao)
{
	case Direcao_cardial.Leste:

		collision_rectangle_coord[1] = x;
		collision_rectangle_coord[2] = y  - sprite_height/2;
		collision_rectangle_coord[3] = x + sprite_width -offset;
		collision_rectangle_coord[4] = y + sprite_height/2;
	break;
	
	case Direcao_cardial.Oeste:
		collision_rectangle_coord[1] = x + offset;
		collision_rectangle_coord[2] = y  - sprite_height/2;
		collision_rectangle_coord[3] = x + sprite_width;
		collision_rectangle_coord[4] = y + sprite_height/2;
	break;
	
	case Direcao_cardial.Sul:
		collision_rectangle_coord[1] = bbox_left;
		collision_rectangle_coord[2] = bbox_top;
		collision_rectangle_coord[3] = bbox_right - offset;
		collision_rectangle_coord[4] = bbox_bottom - offset - 10;
	break;
	
	case Direcao_cardial.Norte:
		collision_rectangle_coord[1] = bbox_left;
		collision_rectangle_coord[2] = bbox_top + offset;
		collision_rectangle_coord[3] = bbox_right;
		collision_rectangle_coord[4] = bbox_bottom;
	break;
}