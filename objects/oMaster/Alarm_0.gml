randomize();
var spriteW = sprite_get_width(Block)*9;
var platformW = sprite_get_width(Platform);
var currentPosX = location[index][0]
var currentPosY = location[index][1]

if (count mod 3 == 0){
	for (var i = 0; i < 3; i++){
		platforms[pIndex] = instance_create_depth(currentPosX+spriteW/2+i*platformW, currentPosY, -1, oPlatform);
		pIndex++;
	}
}

index++;

var prevPosX = location[index-1][0]
var prevPosY = location[index-1][1]

location[index][0] = prevPosX+spriteW;
location[index][1] = prevPosY+choose(-16,16);

if (array_length(location) == 11) {
	var l1 = location[8]
	var l2 = location[9]
	var l3 = location[10]
	location = [l1, l2, l3]
	index = 2;
}

if (array_length(platforms) == 9) {
	var p1 = platforms[3]
	var p2 = platforms[4]
	var p3 = platforms[5]
	var p4 = platforms[6]
	var p5 = platforms[7]
	var p6 = platforms[8]
	platforms = [p1, p2, p3, p4, p5, p6]
	pIndex = 5;
}

count++;
alarm[0] = alarmR;
