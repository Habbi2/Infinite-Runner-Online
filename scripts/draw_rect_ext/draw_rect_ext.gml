/// @description  draw_rect_ext(x, y, w, h, c, a)
/// @param x
/// @param  y
/// @param  w
/// @param  h
/// @param  c
/// @param  a
function draw_rect_ext(argument0, argument1, argument2, argument3, argument4, argument5) {
	var c = draw_get_color();
	var a = draw_get_alpha();
	var _x = argument0;
	var _y = argument1;
	draw_set_color(argument4);
	draw_set_alpha(argument5);
	draw_rectangle(_x, _y, _x + argument2, _y + argument3, false);
	draw_set_color(c);
	draw_set_alpha(a);
	//draw_sprite_part_ext(sprWhite32, 0, 8, 8, 16, 16, argument0, argument1, argument2 / 16, argument3 / 16, argument4, argument5);



}
