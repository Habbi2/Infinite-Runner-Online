function packet_handle_server(argument0) {
	var b = inbuf, p, s;
	var from = argument0;
	net_map[?from] = current_time;
	switch (buffer_read(b, buffer_u8)) {
	    case packet_t.ping: // ()
	        p = packet_start(packet_t.ping);
	        packet_send_to(p, from);
	        break;
	    case packet_t.chat: // (message:string)
	        s = steam_get_user_persona_name_w(from) + ": " + buffer_read(b, buffer_string);
	        chat_add(s);
	        //
	        p = packet_start(packet_t.chat);
	        buffer_write(p, buffer_string, s);
	        packet_send_all(p);
	        //
	        break;
	    case packet_t.leaving:
	        packet_handle_leaving(from);
	        // inform the other players:
	        var b = packet_start(packet_t.leaving);
	        buffer_write_int64(b, uid);
	        packet_send_all(b);
	        // show a notice in chat:
	        var s = steam_get_user_persona_name_w(uid) + " left the game.";
	        chat_add(s);
	        var b = packet_start(packet_t.chat);
	        buffer_write(b, buffer_string, s);
	        packet_send_all(b);
	        break;
	    case packet_t.ucursor:
	        // update the server-side player instance:
	        var _x = buffer_read(b, buffer_f32);
	        var _y = buffer_read(b, buffer_f32);
	        var _c = buffer_read(b, buffer_f32);
	        with (obj_cursor) if (user == from) {
	            x = _x;
	            y = _y;
				color = _c;
	        }
	        // inform other clients:
	        p = packet_start(packet_t.ucursor);
	        buffer_write_int64(p, from);
	        buffer_write(p, buffer_f32, _x);
	        buffer_write(p, buffer_f32, _y);
	        buffer_write(p, buffer_f32, _c);
	        packet_send_except(p, from);
	        break;
	    case packet_t.cursor:
	        // update the server-side player instance:
	        var _hs = buffer_read(b, buffer_f32);
	        var _vs = buffer_read(b, buffer_f32);
	        with (obj_cursor) if (user == from) {
	            hspd = _hs;
	            vspd = _vs;
	        }
	        // inform other clients:
	        p = packet_start(packet_t.cursor);
	        buffer_write_int64(p, from);
	        buffer_write(p, buffer_f32, _hs);
	        buffer_write(p, buffer_f32, _vs);
	        packet_send_except(p, from);
	        break;
		case packet_t.platform:
	        // update the server-side player instance:
	        var _x = buffer_read(b, buffer_f32);
	        var _y = buffer_read(b, buffer_f32);
	        // inform other clients:
	        p = packet_start(packet_t.platform);
	        buffer_write(p, buffer_f32, _x);
	        buffer_write(p, buffer_f32, _y);
	        packet_send_except(p, from);
	        break;
		case packet_t.restart:
	        // update the server-side player instance:
	        room_restart();
	        // inform other clients:
	        p = packet_start(packet_t.restart);
	        packet_send_except(p, from);
	        break;
		case packet_t.forward:
	        // update the server-side player instance:
	        with (oMaster) alarm[0] = 1;
	        // inform other clients:
			p = packet_start(packet_t.forward);
	        packet_send_except(p, from);
	        break;
	}
}
