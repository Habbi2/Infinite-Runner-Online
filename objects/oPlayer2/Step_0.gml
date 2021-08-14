var grounded = place_meeting(x,y+1,oBlock)
var keyRight = keyboard_check(vk_right);
var keyLeft = keyboard_check(vk_left);
var keyJump = keyboard_check_pressed(ord("V"));
var movement = (keyRight - keyLeft) * spd;

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

if (place_meeting(x + hspd, y, oBlock)) {
   while (!place_meeting(x + sign(hspd), y, oBlock)) {
      x += sign(hspd);
   }
   hspd = 0;
}
x += hspd;

if (place_meeting(x, y + vspd, oBlock)) {
	while (!place_meeting(x, y + sign(vspd), oBlock)) {
	    y += sign(vspd);
	}
	vspd = 0;
}
y += vspd;

var p = packet_start(packet_t.cursor);
buffer_write(p, buffer_f32, x);
buffer_write(p, buffer_f32, y);
packet_send_all(p);