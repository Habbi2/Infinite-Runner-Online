function packet_handle_client(argument0) {
	var b = inbuf, p, s;
	var from = argument0;
	net_map[?from] = current_time;
	switch (buffer_read(b, buffer_u8)) {
	    case packet_t.auth: // ()
	        var u = buffer_read_int64(b);
	        ds_list_add(net_list, u);
	        net_map[?u] = current_time;
	        break;
	    case packet_t.ping: // ()
	        p = packet_start(packet_t.ping);
	        packet_send_to(p, from);
	        break;
	    case packet_t.chat: // (message:string)
	        s = buffer_read(b, buffer_string);
	        chat_add(s);
	        break;
	    case packet_t.error: // (error:strign)
	        s = buffer_read(b, buffer_string);
	        chat_add("Error: " + s);
	        if (lobby) {
	            lobby = false;
	            lobby_is_owner = false;
	            lobby_owner = 0;
	            steam_lobby_leave();
	        }
	        if (ingame) {
	            ingame = false;
	            room_goto(rm_menu);
	        }
	        break;
	    case packet_t.leaving:
	        packet_handle_leaving(buffer_read_int64(b));
	        break;
	    case packet_t.start:
	        ingame = true;
	        room_goto(rm_game);
	        break;
	    case packet_t.ucursor:
	        // update the client-side player instance:
			var steam_id = buffer_read_int64(b);
	        var _x = buffer_read(b, buffer_f32);
	        var _y = buffer_read(b, buffer_f32);
	        var _c = buffer_read(b, buffer_f32);
	        with (obj_cursor) if (user == steam_id) {
	            x = _x;
	            y = _y;
				color = _c;
	        }
			break;
	    case packet_t.cursor:
	        // update the client-side player instance:
			var steam_id = buffer_read_int64(b);
	        var _hs = buffer_read(b, buffer_f32);
	        var _vs = buffer_read(b, buffer_f32);
	        with (obj_cursor) if (user == steam_id) {
	            hspd = _hs;
	            vspd = _vs;
	        }
			break;
		case packet_t.platform:
		    // update the client-side player instance:
		    var _x = buffer_read(b, buffer_f32);
		    var _y = buffer_read(b, buffer_f32);
		    with (oMasterLocal) {
				platforms[pIndex] = instance_create(_x,_y,obj_platform);
				pIndex++;
			}
		    break;
		case packet_t.restart:
		    // update the client-side player instance:
		    room_restart();
		    break;
		case packet_t.forward:
		    // update the client-side player instance:
		    break;
	}		
}
