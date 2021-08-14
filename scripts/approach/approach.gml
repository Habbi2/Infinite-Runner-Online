// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function approach(a,b,amount){
	if (a < b) {
		a += amount;
		if (a > b){
			return b	
		}
	} else {
		a -= amount;
		if (a < b) {
			return b;	
		}
	}
	return a
}