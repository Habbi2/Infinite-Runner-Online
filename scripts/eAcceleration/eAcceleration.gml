// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información

function eAcceleration(accel,deccel,maxspeed){
	keyPressedH = key_right - key_left;
	//keyPressedV = key_down - key_up;
	
	if pressingKeysH(){
		hspd = lerp(hspd, maxspeed * keyPressedH, accel);
	} else {
		hspd = lerp(hspd,0,deccel);
	}
	//if pressingKeysV(){
	//	vspd = lerp(vspd, maxspeed * keyPressedV, accel);
	//} else {
	//	vspd = lerp(vspd,0,deccel);
	//}
}