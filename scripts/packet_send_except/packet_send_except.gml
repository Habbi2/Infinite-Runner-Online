/// @description  packet_send_except(buf, except_to_id)
/// @param buf
/// @param  except_to_id
function packet_send_except(argument0, argument1) {
	with (obj_steam) {
	    var b = argument0;
	    var e = argument1;
	    var p = buffer_tell(b);
	    if (lobby_is_owner) {
	        // if we're server, send to clients
	        var n = ds_list_size(net_list);
	        for (var i = 0; i < n; i++) {
	            var u = net_list[|i];
	            if (u != e) steam_net_packet_send(u, b, p, steam_net_packet_type_reliable);
	        }
	    } else if (e != lobby_owner) {
	        // if we're client, send to server
	        steam_net_packet_send(lobby_owner, b, p, steam_net_packet_type_reliable);
	    }
	}



}
