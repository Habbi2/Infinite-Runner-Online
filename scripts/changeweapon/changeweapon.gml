// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function changeweapon(argument0) {
	weapon = argument0;
	var wp_map = weapons[weapon];
	sprite = wp_map[? "sprite"];
	recoil = wp_map[? "recoil"];
	recoil_push = wp_map[? "recoil_push"];
	damage = wp_map[? "damage"];
	projectile = wp_map[? "projectile"];
	startup = wp_map[? "startup"];
	bulletspeed = wp_map[? "bulletspeed"];
	length = wp_map[? "length"];
	cooldown = wp_map[? "cooldown"];
	automatic = wp_map[? "automatic"];
}
