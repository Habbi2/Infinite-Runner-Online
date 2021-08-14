// Draw player fills:
//draw_set_color(c_white);
//with (oPlayer) draw_self();
with (obj_cursor) draw_sprite_ext(Player,0,x,y,image_xscale,image_yscale,0,color,1);

// Draw names above players:
draw_set_color(c_white);
draw_set_font(fnt_name);
with (obj_cursor) {
    var s = steam_get_user_persona_name_w(user);
    var sw = string_width(string_hash_to_newline(s));
    var sh = string_height(string_hash_to_newline(s));
    var sx = floor(x - sw / 2);
    var sy = floor(y - 36 - sh);
    draw_rect_ext(sx, sy + 1, sw, sh - 2, c_black, 0.7);
    draw_text(sx + 1, sy, string_hash_to_newline(s));
}

////Draw Scores

//var cwidth, cheight;
//cwidth = camera_get_view_width(view_camera[0]);
//cheight = camera_get_view_height(view_camera[0]);
//draw_set_halign(fa_right);

//draw_set_font(fnt_test);

//with (obj_local_player){
//	var name = steam_get_user_persona_name_w(user)
//	draw_text(cwidth - 40,
//	35,
//	string_hash_to_newline(name) + "  Score:  " + string(pscore))
//}

//with (oPlayer){
//	var name = steam_get_user_persona_name_w(user)
//	draw_text(cwidth - 40,
//	70 + number * 35,
//	string_hash_to_newline(name) + "  Score:  " + string(pscore))
//}

//draw_set_halign(fa_center);

////Wins Round
//var n = ds_map_size(players)

//if (n == 1) && instance_exists(oPlayer) {
//	with (obj_local_player) if (exists){
//		if (Obj_scoreboard.win) draw_text(cwidth/2, cheight/2, string_hash_to_newline(steam_get_user_persona_name_w(obj_local_player.user)) + "  WINS");
//	}
//	with (oPlayer) if (exists){
//		if (Obj_scoreboard.win) draw_text(cwidth/2, cheight/2, string_hash_to_newline(steam_get_user_persona_name_w(user)) + "  WINS");
//	}
//}

////Wins Game

//if (obj_local_player.pscore == 10) {
//	draw_text(cwidth/2, cheight/2, string_hash_to_newline(steam_get_user_persona_name_w(obj_local_player.user)) + "  WINS");
//	with (Obj_scoreboard) if (alarm[0] == -1) alarm[0] = room_speed*20;
//}
//with (oPlayer) if (pscore == 10) {
//	draw_text(cwidth/2, cheight/2, string_hash_to_newline(steam_get_user_persona_name_w(user)) + "  WINS");
//	with (Obj_scoreboard) if (alarm[0] == -1) alarm[0] = room_speed*20;
//}
