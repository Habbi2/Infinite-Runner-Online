game_name = "Steamworks.gml example";
game_version = 1000;
ingame = false; // whether currently in-game
lobby = false; // whether currently in a lobby
lobby_is_owner = false; // whether acting as a server
creating_lobby = false; // whether currently in async lobby creation
joining_lobby = false; // whether currently awaiting initial connection
user = steam_get_user_steam_id(); // local user ID
names = ds_map_create(); // <steamid:int64 -> name:string>
steam_get_user_persona_name_w(user); // prefetch local name
net_list = ds_list_create(); // <steamid:int64>
net_map = ds_map_create(); // <steamid:int64, time>
inbuf = buffer_create(1024, buffer_grow, 1); // used for storing incoming packets
outbuf = buffer_create(1024, buffer_grow, 1); // used for building outgoing packets
chat_init();
// copy the startup command into clipboard:
clipboard_set_text(parameter_string_all());



