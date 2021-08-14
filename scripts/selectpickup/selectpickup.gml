// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function selectpickup(argument0) {
	pickup = argument0;
	var wp_map = pickups[pickup];
	sprite = wp_map[? "sprite"];
}

function selectbullet(argument0) {
	bullet = argument0;
	var wp_map = bullets[bullet];
	sprite = wp_map[? "sprite"];
}


function selectbullet2(argument0) {
	bullet = argument0;
	var wp_map = bullets2[bullet];
	sprite = wp_map[? "sprite"];
}