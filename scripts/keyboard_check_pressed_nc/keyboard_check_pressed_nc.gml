/// @description  keyboard_check_pressed_nc(key)
/// @param key
function keyboard_check_pressed_nc(argument0) {
	return !global.chat_open && keyboard_check_pressed(argument0);



}
