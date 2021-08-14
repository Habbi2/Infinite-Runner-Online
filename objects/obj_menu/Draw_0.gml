draw_set_font(fnt_test);
draw_set_color(c_black);
var s = "", i, n;
if (obj_steam.lobby) {
    if (obj_steam.joining_lobby) {
        s += "Connecting...#";
    } else if (obj_steam.lobby_is_owner) {
        s += "Currently in your own lobby.#";
    } else s += "Currently in a lobby.#";
    //
    s += "0: Leave#";
    if (keyboard_check_pressed_nc(ord("0"))) {
        steam_lobby_leave();
        steam_reset_state();
    }
    //
    s += "1: Invite#";
    if (keyboard_check_pressed_nc(ord("1"))) {
        steam_lobby_activate_invite_overlay();
    }
    //
    if (obj_steam.lobby_is_owner) {
        s += "2: Start#";
        if (keyboard_check_pressed_nc(ord("2"))) {
            var p = packet_start(packet_t.start);
            packet_send_all(p);
            obj_steam.ingame = true;
            steam_lobby_set_type(steam_lobby_type_private);
            room_goto(rm_game);
        }
    }
    //
    if (!obj_steam.joining_lobby) {
        n = ds_list_size(obj_steam.net_list);
        s += string(n + 1) + " member";
        if (n != 0) s += "s";
        s += ":#";
        // local user:
        s += "+ " + steam_get_user_persona_name_w(obj_steam.user) + "#";
        // remote users:
        for (i = 0; i < n; i++) {
            s += "+ " + steam_get_user_persona_name_w(obj_steam.net_list[|i]) + "#";
        }
    }
    //
} else if (obj_steam.creating_lobby) {
    s += "Creating a lobby...#";
} else {
    s += "1: Host a public lobby#";
    if (keyboard_check_pressed_nc(ord("1"))) {
        steam_lobby_create(steam_lobby_type_public, 32);
        obj_steam.creating_lobby = true;
    }
    //
    s += "2: Host a friends-only lobby#";
    if (keyboard_check_pressed_nc(ord("2"))) {
        steam_lobby_create(steam_lobby_type_friends_only, 32);
        obj_steam.creating_lobby = true;
    }
    //
    s += "3: Host a private lobby#";
    if (keyboard_check_pressed_nc(ord("3"))) {
        steam_lobby_create(steam_lobby_type_private, 32);
        obj_steam.creating_lobby = true;
    }
    //
    s += "4: Refresh the lobby list"
    if (steam_lobby_list_is_loading()) {
        s += " (loading)";
    } else if (alarm[0] < 5 * room_speed) {
        s += " (in " + string(ceil(alarm[0]/room_speed)) + ")";
    }
    s += "#";
    if (keyboard_check_pressed_nc(ord("4"))) {
        alarm[0] = 1;
    }
    //
    n = min(32, steam_lobby_list_get_count());
    for (i = 0; i < n; i++) {
        var c;
        if (i < 5) {
            c = ord("5") + i;
        } else c = ord("A") + i;
        //
        s += chr(c) + ": Join " + steam_lobby_list_get_data(i, "title") + "#";
        if (keyboard_check_pressed_nc(c)) {
            steam_lobby_list_join(i);
        }
    }
}
draw_text(16, 16, string_hash_to_newline(s));

