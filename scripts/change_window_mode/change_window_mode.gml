// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function change_window_mode(argument0){
	switch(argument0){
		case 0: window_set_fullscreen(true); break;	
		case 1: window_set_fullscreen(false); break;
	}
}