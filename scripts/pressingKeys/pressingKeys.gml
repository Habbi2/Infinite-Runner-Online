// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function pressingKeysH(){
if (key_right && key_left) || (!key_right && !key_left) return false;

return true;
}

function pressingKeysV(){
if (key_up && key_down) || (!key_up && !key_down) return false;

return true;
}