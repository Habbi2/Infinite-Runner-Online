var p = packet_start(packet_t.platform);
buffer_write(p, buffer_f32, x);
buffer_write(p, buffer_f32, y);
packet_send_all(p);