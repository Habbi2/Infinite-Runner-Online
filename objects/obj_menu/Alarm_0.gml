// only fetch lobbies of same game version:
steam_lobby_list_add_string_filter("game_name", obj_steam.game_name, steam_lobby_list_filter_eq);
steam_lobby_list_add_string_filter("game_version", string(obj_steam.game_version), steam_lobby_list_filter_eq);
steam_lobby_list_request();

