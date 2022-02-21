function scr_player_get_killed() {

scr_screen_shake(10,3);

with (obj_player)
{
	instance_destroy();	
}
with (obj_player_triangle)
{
	instance_destroy();	
}

// Roda a sequência de morte do player
if (obj_draw_controller.player_white) var _sequence = sqc_death_player;
else									var _sequence = sqc_death_player_black;
//var _sequence = sqc_death_player;
var _layer_name = "Animation";

layer_sequence_create(_layer_name, global.x_position_player, global.y_position_player, _sequence);

audio_play_sound(snd_death_ress,120,false);
// No obj_game_controller ocorre o evento de Broadcast Message que faz o player ressucitar
}
