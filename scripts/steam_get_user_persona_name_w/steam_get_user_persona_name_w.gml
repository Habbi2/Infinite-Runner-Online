/// @description  steam_get_user_persona_name_w(steam_id)
/// @param steam_id
function steam_get_user_persona_name_w(argument0) {
	// Display name fetching with caching
	var q = argument0;
	var r = obj_steam.names[?q];
	if (r == undefined) {
	    steam_get_user_persona_name(q);
	    r = "id" + string(q);
	    obj_steam.names[?q] = r;
	}
	return r;



}
