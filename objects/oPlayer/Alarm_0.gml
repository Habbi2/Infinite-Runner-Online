var p = packet_start(packet_t.ucursor);
if (obj_steam.lobby_is_owner) buffer_write_int64(p, user);
buffer_write(p, buffer_f32, x);
buffer_write(p, buffer_f32, y);
buffer_write(p, buffer_f32, color);
packet_send_all(p);

alarm[0] = 30;