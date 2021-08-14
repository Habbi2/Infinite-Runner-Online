function packet_handle_auth(argument0) {
	var from = argument0, b;
	if (buffer_read(inbuf, buffer_u8) != packet_t.auth) {
	    exit;
	} else if (buffer_read(inbuf, buffer_string) != game_name) {
	    // game must match (can also be used for game mode filters)
	    b = packet_start(packet_t.error);
	    buffer_write(b, buffer_string, "Game mismatch.");
	    packet_send_to(b, from);
	} else if (buffer_read(inbuf, buffer_u32) != game_version) {
	    // game version must match
	    b = packet_start(packet_t.error);
	    buffer_write(b, buffer_string, "Version mismatch.");
	    packet_send_to(b, from);
	} else if (ingame) {
	    // don't allow to join mid-game (you can change this though)
	    b = packet_start(packet_t.error);
	    buffer_write(b, buffer_string, "Game has already started.");
	    packet_send_to(b, from);
	} else {
	    // inform existing players about the newcomer:
	    b = packet_start(packet_t.auth);
	    buffer_write_int64(b, from);
	    packet_send_all(b);
	    // inform the newcomer about the existing players:
	    n = ds_list_size(net_list);
	    for (var i = 0; i < n; i++) {
	        b = packet_start(packet_t.auth);
	        buffer_write_int64(b, net_list[|i]);
	        packet_send_to(b, from);
	    }
	    // send the first ping (bounced to keep connection alive):
	    b = packet_start(packet_t.ping);
	    packet_send_to(b, from);
	    // inform the player that they are now connected:
	    b = packet_start(packet_t.chat);
	    buffer_write(b, buffer_string, "Connected.");
	    packet_send_to(b, from);
	    // add them to the list of players:
	    ds_list_add(net_list, from);
	    net_map[?from] = current_time;
	    exit;
	}



}
