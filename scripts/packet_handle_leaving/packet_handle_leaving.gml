/// @description  packet_handle_leaving(steam_id)
/// @param steam_id
function packet_handle_leaving(argument0) {
	var u = argument0;
	ds_list_delete(net_list, ds_list_find_index(net_list, u));
	ds_map_delete(net_map, u);
	//
	if (ingame) {
	    with (oPlayer) if (user == u) instance_destroy();
	}
}
