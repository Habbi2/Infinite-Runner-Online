/// @description  chat_send(msg)
/// @param msg
function chat_send(argument0) {
	var s = argument0;
	with (obj_steam) if (lobby) {
	    if (lobby_is_owner) {
	        s = steam_get_persona_name() + ": " + s;
	        chat_add(s);
	    }
	    //
	    var p = packet_start(packet_t.chat);
	    buffer_write(p, buffer_string, s);
	    packet_send_all(p);
	}



}
