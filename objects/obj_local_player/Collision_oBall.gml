if (start == 0) start = 1;
if (other.owner != id) with (other){
	owner = other.id;
	if (abs(hspd) > 8) {
		hspd = random_range(20,60) * other.image_xscale;
		vspd = -60
	} else {
		hspd = random_range(20,60) * other.image_xscale;
		vspd = -60
	}
}