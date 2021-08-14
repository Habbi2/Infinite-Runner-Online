// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function playerJump(){
	if key_jump{
		if (extrajumps > 0) vspd = -jump;
		extrajumps--;
	}
}