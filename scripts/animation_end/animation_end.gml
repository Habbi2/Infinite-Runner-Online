// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function animation_end() {
//returns true if the animation will loop this step.

	//Script courtesy of PixellatedPope & Minty Python from the GameMaker subreddit discord 
	//https://www.reddit.com/r/gamemaker/wiki/discord

	var _sprite=sprite_index;
	var _image=image_index;
	if(argument_count > 0)	 _sprite=argument[0];
	if(argument_count > 1)	_image=argument[1];
	var _type=sprite_get_speed_type(sprite_index);
	var _spd=sprite_get_speed(sprite_index)*image_speed;
	if(_type == spritespeed_framespersecond)
	_spd = _spd/room_speed;
	if(argument_count > 2) _spd=argument[2];
	return _image+_spd >= sprite_get_number(_sprite);
}
