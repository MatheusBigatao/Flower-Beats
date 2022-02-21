// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_change_room(_target_room){
	with(obj_game_controller)
	{
		run_transition = true;
		estado_trasicao = "saindo_room";
		target_room = _target_room;
	}
}