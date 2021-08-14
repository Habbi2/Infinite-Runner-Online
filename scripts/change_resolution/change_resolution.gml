// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function change_resolution(resolution){
		if (resolution == 0)	window_set_size(384,216);
		if (resolution == 1)	window_set_size(768,432);
		if (resolution == 2)	window_set_size(800,450);
		if (resolution == 3)	window_set_size(1024,576);
		if (resolution == 4)	window_set_size(1280,720);
		if (resolution == 5)	window_set_size(1366,768);
		if (resolution == 6)	window_set_size(1600,900);
		if (resolution == 7)	window_set_size(1920,1080);
}