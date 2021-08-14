var grounded = place_meeting(x,y+1,oBlock) || place_meeting(x,y+1,obj_cursor);
var keyRight = keyboard_check(ord("D"));
var keyLeft = keyboard_check(ord("A"));
var keyJump = keyboard_check_pressed(vk_space);
var movement = (keyRight - keyLeft) * spd;
var restart = keyboard_check_pressed(ord("R"));

if (grounded) {
	doubleJump = 1;
	hspd = approach(hspd, movement, acceleration);
	if (keyJump){
	vspd -= jForce;	
	}
} else {
	hspd = approach(hspd, movement, airAcceleration);
	vspd += grav;
	if (doubleJump > 0 && keyJump){
		vspd = -jForce;
		doubleJump--;
	}
}

if (place_meeting(x + hspd, y, oBlock) || place_meeting(x + hspd, y, obj_cursor)) {
   while (!place_meeting(x + sign(hspd), y, oBlock) && !place_meeting(x + sign(hspd), y, obj_cursor)) {
      x += sign(hspd);
   }
   hspd = 0;
}

x += hspd;


if (place_meeting(x, y + vspd, oBlock) || place_meeting(x, y + vspd, obj_cursor)) {
	while (!place_meeting(x, y + sign(vspd), oBlock) && !place_meeting(x, y + sign(vspd), obj_cursor)) {
	    y += sign(vspd);
	}
	vspd = 0;
}

y += vspd;

if (obj_steam.lobby_is_owner){
	if (instance_exists(oMaster) && oMaster.pIndex > 6){
		if (place_meeting(x, y+1, oMaster.platforms[oMaster.pIndex-4]) || place_meeting(x, y+1, oMaster.platforms[oMaster.pIndex-5]) || place_meeting(x, y+1, oMaster.platforms[oMaster.pIndex-6])){	
			 oMaster.alarm[0] = 1;
		}
	}
	if (place_meeting(x, y+1, obj_platform_start) && (oMaster.pIndex < 6)) oMaster.alarm[0] = 1;
} else {
	if (instance_exists(oMasterLocal) && oMasterLocal.pIndex > 6){
		if (place_meeting(x, y+1, oMasterLocal.platforms[oMasterLocal.pIndex-4]) || place_meeting(x, y+1, oMasterLocal.platforms[oMasterLocal.pIndex-5]) || place_meeting(x, y+1, oMasterLocal.platforms[oMasterLocal.pIndex-6])){	
			var p = packet_start(packet_t.forward);
			packet_send_all(p);
		}
	}
	if (place_meeting(x, y+1, obj_platform_start) && oMasterLocal.pIndex < 6) {
		var p = packet_start(packet_t.forward);
		packet_send_all(p);
	}
}

if (restart) {
	if (obj_steam.lobby_is_owner) {
		room_restart();
		var p = packet_start(packet_t.restart);
		packet_send_all(p);	
	}
}

var p = packet_start(packet_t.cursor);
if (obj_steam.lobby_is_owner) buffer_write_int64(p, user);
buffer_write(p, buffer_f32, hspd);
buffer_write(p, buffer_f32, vspd);
packet_send_all(p);