// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function PlayerFree(){
	//Calculate Movement 
	var gAccel = .04;
	var gDeccel = .035;

	if !instance_exists(o_local_weapon) {
		vspd += grav;
		if place_free(x,y){
			eAcceleration(gAccel,gDeccel,maxHspeed);
		}
	} else {
		if (o_local_weapon.weapon != 2)	{
			vspd += grav;
			if place_free(x,y){
				eAcceleration(gAccel,gDeccel,maxHspeed);
			}
		} else {
			keyPressedH = key_right - key_left;
			keyPressedV = key_down - key_up;
	
			if pressingKeysH(){
				hspd = lerp(hspd, maxspeed * keyPressedH, gAccel);
			} else {
				hspd = lerp(hspd,0,gDeccel);
			}
			if pressingKeysV(){
				vspd = lerp(vspd, maxspeed * keyPressedV, gAccel);
			} else {
				vspd = lerp(vspd,0,gDeccel);
			}
		}
	}
	//if key_jump && (o_local_walls.start == false) o_local_walls.start = true;

	//Horizontal Collision
	if (place_meeting(x+hspd,y,oWall))
	{
	    while (!place_meeting(x+sign(hspd),y,oWall))
		{
			x = x + sign(hspd);
		}
	    hspd = 0;
	} 

	var nw = instance_nearest(x,y,o_local_obstacle);
	if (place_meeting(x+hspd,y,o_local_obstacle))
	{
	    if (nw.hspeed > 0) hspd -= hspd - abs(nw.hspeed); 
		if (nw.hspeed == 0) && (!place_meeting(x,y,oObstacle)) hspd = 0;
		if (nw.hspeed < 0) hspd -= hspd + abs(nw.hspeed);
	} 
	
	//if (place_meeting(x+hspd,y,oObstaclestart))
	//{
	//    hspd = 0;
	//}
	
	x += hspd;
	
	//Veritical Collision 
	if (place_meeting(x,y+vspd,oWall))
	{
	    while (!place_meeting(x,y+sign(vspd),oWall))
		{
			y = y + sign(vspd);
		}
		eAcceleration(gAccel,gDeccel,maxHspeed);
	    vspd = 0;
	} 


	if (place_meeting(x,y+vspd,o_local_obstacle))
	{
		eAcceleration(gAccel,gDeccel,maxHspeed);
		if (nw.vspeed > 0) vspd -= vspd - nw.vspeed;
		if (nw.vspeed == 0) vspd = 0;
		if (nw.vspeed < 0) vspd -= vspd - nw.vspeed;
	} 
	

	//if (place_meeting(x,y+vspd,oObstaclestart))
	//{
	//	eAcceleration(gAccel,gDeccel,maxHspeed);
	//	if (oObstaclestart.vspeed != 0) vspd = oObstaclestart.vspeed; else vspd = 0;
	//} 

	y += vspd;

	if (hspd > 0) image_xscale = 1;
	if (hspd < 0) image_xscale = -1;


	if (reflected == true) rtimer--;
	if (rtimer < 0) {
		rtimer = 5;
		reflected = false;
	}

	if (hit == true){
		hittimer--;	
	}

	if (hittimer < 0){
		hittimer = 5;
		hit = false;
	}
	
	if (invulnerable = false) && place_meeting(x,y,oEnemy){
		if (hit == false){
		hp -= 2;
		hit = true;
		hspd = -hspd * 1.2
		vspd = -5;
		flashr = 3;
		}	
	}
	
	invucd--
	if (invucd < 0){
		invulnerable = false
		invucd = 20;
	}
	
	attackcd = 5;
	
	//Animations
	mask_index = sPlayer;
	sprite_index = sPlayer;
	
	if (key_attack2){
		hspd = 0;
		vspd = 0;
		global.freeze = true
	} 
	if (key_attack2_released){
		global.freeze = false;
	}
	
	if (key_attack2_released) && (attackcd > 0){
	state = PLAYERSTATE.ATTACK;
	}
	
}