/// @description 

width_room = room_width;
height_room = room_height;

espacamento_entre_buttons = sprite_get_width(spr_button);
espacamento_entre_buttons *= 1.2;

offset_x_room = width_room/10;
offset_y_room = height_room/10;

// Criar os botoes para ir para todas os levels disponiveis entre rm_initial e rm_final
var i =0;
var j =0;
var _room_index = room_next(rm_initial);
var _number_level = 0;

//for (var _room_index = rm_initial +1; _room_index <rm_final; _room_index++)
//{

while (_room_index != rm_final)
{
	// Posicionamento dos buttons
	var posicao_x = offset_x_room+i*espacamento_entre_buttons;
	var posicao_y = offset_y_room+j*espacamento_entre_buttons;
	
	var _room_goto = _room_index;
	
	// Criando os buttons e definindo suas propriedades
	var _button = instance_create_layer(posicao_x, posicao_y,"Select_level",obj_button_select_level);
		with(_button)
		{
			type_button = "go_room";
			go_to_room = _room_goto;
			number_level = _number_level;
		}
	_number_level++;
	
	// Ajustando o posicionamento para o proximo button
	i++
	if (i*espacamento_entre_buttons > width_room*0.8)
	{
		i =0;
		j++
	}
	_room_index = room_next(_room_index);
	
}