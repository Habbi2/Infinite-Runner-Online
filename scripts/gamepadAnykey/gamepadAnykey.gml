// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function gamepadAnykey(argument0) {
	dvc=argument0;
	return (gamepad_button_check(dvc, gp_face1)||gamepad_button_check(dvc, gp_face2)||gamepad_button_check(dvc, gp_face3)||gamepad_button_check(dvc, gp_face4)||gamepad_button_check(dvc, gp_shoulderl)||gamepad_button_check(dvc, gp_shoulderr)||gamepad_button_check(dvc, gp_shoulderlb)||gamepad_button_check(dvc, gp_shoulderrb)||gamepad_button_check(dvc, gp_select)||gamepad_button_check(dvc, gp_start) )


}
