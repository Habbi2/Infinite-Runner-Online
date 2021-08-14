 //Camera
var camx = camera_get_view_x(view_camera[0]);
var camy = camera_get_view_y(view_camera[0]);
var offset = 30;
var cx = oPlayer.x - camera_get_view_width(view_camera[0])/2 - offset;
var cy = oPlayer.y - camera_get_view_height(view_camera[0])/2;
//var vw = camera_get_view_width(view_camera[0]);
//var vh = camera_get_view_height(view_camera[0]);

camera_set_view_pos(view_camera[0], lerp(camx, cx, 0.05), lerp(camy, cy, 0.03));

//instance_activate_all()
//instance_deactivate_region(camx-offset*4,camy-offset*4,vw+offset*4,vh+offset*4, false, true);