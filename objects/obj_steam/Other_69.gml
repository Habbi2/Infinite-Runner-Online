var e = async_load, uid;
var ok = e[?"success"];
switch (e[?"event_type"]) {
case "user_persona_name":
    names[?e[?"steamid"]] = e[?"persona_name"];
    break;
case "lobby_created":
    creating_lobby = false;
    if (ok) {
        lobby = true;
        lobby_is_owner = true;
        lobby_owner = steam_lobby_get_owner_id();
        ds_list_clear(net_list);
        ds_map_clear(net_map);
        // set up filters so that the lobby can be found:
        steam_lobby_set_data("game_name", game_name);
        steam_lobby_set_data("game_version", string(game_version));
        steam_lobby_set_data("title", steam_get_user_persona_name_w(user) + "'s lobby");
        //
        trace("Lobby created.");
    } else {
        // Only happens if there's no connection to Steam
        trace("Failed to create a lobby.");
    } 
    break;
case "lobby_joined":
    if (ok) {
        lobby = true;
        lobby_is_owner = false;
        lobby_owner = steam_lobby_get_owner_id();
        joining_lobby = true;
        trace("Lobby joined.");
        // assume connection to lobby owner:
        ds_list_clear(net_list);
        ds_map_clear(net_map);
        ds_list_add(net_list, lobby_owner);
        net_map[?lobby_owner] = current_time;
        // send a greeting-packet:
        var b = packet_start(packet_t.auth);
        buffer_write(b, buffer_string, game_name);
        buffer_write(b, buffer_u32, game_version);
        packet_send_to(b, lobby_owner);
    } else {
        // No connection to Steam or lobby vanished while we were joining
        trace("Failed to join the lobby.");
    }
    break;
case "lobby_join_requested":
    // This event is dispatched when you click on an invitation.
    // Form an ID and join that lobby:
    uid = steam_id_create(e[?"lobby_id_high"], e[?"lobby_id_low"]);
    steam_lobby_join_id(uid);
    trace("Joining a lobby by invitation...");
    break;
}

