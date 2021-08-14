// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function PlayerAttack(){
	key_down2 = keyboard_check(vk_down)
	key_left2 = keyboard_check(vk_left)
	key_right2 = keyboard_check(vk_right)
	key_up2 = keyboard_check(vk_up)
	
	var hinput = key_right2 - key_left2;
	var vinput = key_down2 - key_up2;
	
	//Calculate Movement 
	var gAccel = .04;
	var gDeccel = .035;
	
	invulnerable = true;
	
	vspd += grav;
	eAcceleration(gAccel,gDeccel,maxHspeed);
	
	if instance_exists(oEnemy){
		var spd = maxHspeed//The speed to move at
		var ne = instance_nearest(x,y,oEnemy);
		var pdis = point_distance(x,y,ne.x,ne.y);
		var dir = point_direction(x,y,ne.x,ne.y);
		if (pdis < 600) {
			if !place_meeting(x+lengthdir_x(spd,dir),y+lengthdir_y(spd,dir),oObstacle){
				if ((hinput = 1) && (ne.x > x)) || ((hinput = -1) && (ne.x < x)) || ((vinput = -1) && (ne.y < y)) || ((vinput = 1) && (ne.y > y)){
					x += lengthdir_x(spd*1.5, dir);
					y += lengthdir_y(spd*1.5, dir);
					hspd += lengthdir_x(spd/1.2,dir);
					vspd += lengthdir_y(spd/1.2,dir);
					if (sprite_index != sAttack)
					{
						sprite_index = sAttack;
						image_index = 0;
						ds_list_clear(hitByAttack);	
					}
					mask_index = sAttackHB;
					var hitByAttackNow = ds_list_create();
					var hits = instance_place_list(x,y,oEnemy,hitByAttackNow,false);
					if (hits > 0)
					{
						for (var i = 0; i < hits; i++)
						{	
							var hitID = hitByAttackNow[| i];
							if (ds_list_find_index(hitByAttack,hitID) == -1)
							{
								ds_list_add(hitByAttack,hitID);	
								with(hitID)
								{
									hp = 0;
								}
							}
						}
					}
					ds_list_destroy(hitByAttackNow);
					if animation_end(){
						mask_index = sPlayer;
						sprite_index = sPlayer;
					}
				}
			}
			else
			{
				while(!place_meeting(x+lengthdir_x(1,dir),y+lengthdir_y(1,dir),oObstacle))
				{
					x+=lengthdir_x(1,dir)
					y+=lengthdir_y(1,dir)
				}
				mask_index = sPlayer;
				sprite_index = sPlayer;
				state = PLAYERSTATE.FREE;
			}
		}
	}

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
		while (!place_meeting(x+sign(hspd),y,o_local_obstacle))
		{
			x = x + sign(hspd);
		}
	    if (nw.hspeed > 0) hspd -= hspd - abs(nw.hspeed); 
		if (nw.hspeed == 0) hspd = 0;
		if (nw.hspeed < 0) hspd -= hspd + abs(nw.hspeed);
	} 


	x += hspd;
	
	//Veritical Collision 
	if (place_meeting(x,y+vspd,oWall))
	{
	    while (!place_meeting(x,y+sign(vspd),oWall))
		{
			y = y + sign(vspd);
		}
	    vspd = 0;
	} 


	if (place_meeting(x,y+vspd,o_local_obstacle))
	{
		while (!place_meeting(x,y+sign(vspd),o_local_obstacle))
		{
			y = y + sign(vspd);
		}
		if (nw.vspeed > 0) vspd -= vspd - nw.vspeed;
		if (nw.vspeed == 0) vspd = 0;
		if (nw.vspeed < 0) vspd -= vspd - nw.vspeed;
	} 

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
	attackcd--;
	
	if(attackcd < 0)
	{
		state = PLAYERSTATE.FREE;
		attackcd = 5;
		hspd = 0;
		vspd = 0;
	}
	
}