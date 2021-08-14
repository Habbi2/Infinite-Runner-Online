// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function inputGet(argument0) {

	dvc = argument0;

	if (abs(gamepad_axis_value(dvc,gp_axislh)) > 0.2)
		{
			key_left = abs(min(gamepad_axis_value(dvc,gp_axislh),0));
			key_right = max(gamepad_axis_value(dvc,gp_axislh),0);
			controller = 1;
		}

	if (gamepad_button_check_pressed(dvc,gp_face1))
		{
			key_jump = 1;
			controller = 1;	
		}

	controllerh = gamepad_axis_value(dvc,gp_axisrh);
	controllerv = gamepad_axis_value(dvc,gp_axisrv);
}