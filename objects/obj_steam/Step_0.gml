if (lobby && steam_lobby_get_owner_id() != lobby_owner) {
    // lobby invalidated
    if (!lobby_is_owner) trace("Connection lost.");
    steam_reset_state();
}
// server-only logic:
if (lobby_is_owner) {
    // handle timeouts
    var i = ds_list_size(net_list);
    while (--i >= 0) {
        var u = net_list[|i];
        if (net_map[?u] < current_time - 7000) {
            packet_handle_leaving(u);
            // inform the other players:
            var b = packet_start(packet_t.leaving);
            buffer_write_int64(b, u);
            packet_send_all(b);
            // show a notice in chat:
            var s = steam_get_user_persona_name_w(u) + " timed out.";
            chat_add(s);
            var b = packet_start(packet_t.chat);
            buffer_write(b, buffer_string, s);
            packet_send_all(b);
        }
    }
}
// receive packets:
while (steam_net_packet_receive()) {
    var from = steam_net_packet_get_sender_id();
    var b = inbuf;
    if (lobby_is_owner) {
        if (ds_map_exists(net_map, from)) {
            // a packet from someone familiar
            buffer_seek(inbuf, buffer_seek_start, 0);
            steam_net_packet_get_data(inbuf);
            packet_handle_server(from);
        } else {
            // sender unknown, require a handshake to establish connection
            // make sure that the packet is big enough to be a handshake-packet:
            if (steam_net_packet_get_size() < 6) continue; // (skip this packet)
            // make sure that the player is actually in our lobby, however:
            var i, n;
            n = steam_lobby_get_member_count();
            for (i = 0; i < n; i++) {
                if (steam_lobby_get_member_id(i) == from) break;
            }
            if (i >= n) continue; // (skip this packet)
            //
            buffer_seek(inbuf, buffer_seek_start, 0);
            steam_net_packet_get_data(inbuf);
            packet_handle_auth(from);
        }
    } else {
        // as a client, only accept packets from server:
        if (from != lobby_owner) continue;
        //
        buffer_seek(inbuf, buffer_seek_start, 0);
        steam_net_packet_get_data(inbuf);
        packet_handle_client(from);
        joining_lobby = false;
    }
}
//
chat_update();
