/// @description Animação de Morte do Player
if event_data[? "event_type"] == "sequence event"
{
	switch (event_data[? "message"])
	    {
		// ANIMAÇÃO DE MORTE DO PLAYER
		    case "end_animation_death":
			case "end_animation_death_black":
			
				// Destroi a sequencia de morte ao terminar a sequencia
				var _sequence_id = event_data[? "element_id"];
				layer_sequence_destroy(_sequence_id);
			
				// Começa a sequencia de ressucitar nas coordenadas do ultimo checkpoint / Cria o obj_player
				//var _sequence = sqc_ressurect_player;
				if (obj_draw_controller.player_white) var _sequence = sqc_ressurect_player;
				else									var _sequence = sqc_ressurect_player_black;
				var _layer_name = "Animation";
				var _x_checkpoint = global.coord_checkpoint[1];
				var _y_checkpoint = global.coord_checkpoint[2];
			
				layer_sequence_create(_layer_name, _x_checkpoint, _y_checkpoint, _sequence);
				instance_create_layer(_x_checkpoint, _y_checkpoint, "Player" , obj_player);
			

			break;
		
			case "end_animation_ressurect":
			 // Destroi a sequence de ressucitar ao terminar
				var _sequence_id = event_data[? "element_id"];
				layer_sequence_destroy(_sequence_id);
			 break;
		 
		#region LEVEL ZERO
		
		//EFEITO SONORO
			case "make_sound_right_place":
				audio_play_sound(snd_correct,140,false);
			break;
		
		// Cria o triangulo no player no meio da sequence
			case "create_triangle":
				with (obj_player)
				{
					instance_create_depth(x,y,depth -1, obj_player_triangle);
					can_walk = true;
					global.have_triangle = true;
				}
			break;
			
		// Destroi a sequence ao terminar
			case "destroy_sequence_fusion":
				var _sequence_id = event_data[? "element_id"];
				layer_sequence_destroy(_sequence_id);
				if (audio_is_playing(snd_fusion_triangle))
				{
					audio_stop_sound(snd_fusion_triangle);	
				}
			break;
			
		#endregion
		}
		

}