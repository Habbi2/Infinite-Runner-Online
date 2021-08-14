function steam_reset_state() {
	with (obj_steam) {
	    ds_list_clear(net_list);
	    ds_map_clear(net_map);
	    lobby = false;
	    lobby_is_owner = false;
	    lobby_owner = 0;
	    creating_lobby = false;
	    joining_lobby = false;
	    if (ingame) {
	        ingame = false;
	        room_goto(rm_menu);
	    }
	}



}
