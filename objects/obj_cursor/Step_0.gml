if (place_meeting(x + hspd, y, oBlock) || place_meeting(x + hspd, y, oPlayer)) {
   while (!place_meeting(x + sign(hspd), y, oBlock) && !place_meeting(x + sign(hspd), y, oPlayer)) {
      x += sign(hspd);
   }
   hspd = 0;
}

x+= hspd;

if (place_meeting(x, y + vspd, oBlock) || place_meeting(x, y + vspd, oPlayer)) {
	while (!place_meeting(x, y + sign(vspd), oBlock) && !place_meeting(x, y + sign(vspd), oPlayer)) {
	    y += sign(vspd);
	}
	vspd = 0;
}

y += vspd;