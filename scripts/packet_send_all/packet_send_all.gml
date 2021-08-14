/// @description  packet_send_all(buf)
/// @param buf
function packet_send_all(argument0) {
	with (obj_steam) {
	    var b = argument0;
	    var p = buffer_tell(b);
	    if (lobby_is_owner) {
	        // if we're server, send to clients
	        var n = ds_list_size(net_list);
	        for (var i = 0; i < n; i++) {
	            steam_net_packet_send(net_list[|i], b, p, steam_net_packet_type_reliable);
	        }
	    } else {
	        // if we're client, send to server
	        steam_net_packet_send(lobby_owner, b, p, steam_net_packet_type_reliable);
	    }
	}



}
