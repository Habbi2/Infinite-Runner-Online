/// @description  buffer_print_hex(buffer, start, length)
/// @param buffer
/// @param  start
/// @param  length
function buffer_print_hex(argument0, argument1, argument2) {
	gml_pragma("global", "global.buffer_print_hex_buf = buffer_create(1024, buffer_grow, 1);");
	//
	var b = argument0;
	var p = buffer_tell(b);
	buffer_seek(b, buffer_seek_start, argument1);
	//
	var r = global.buffer_print_hex_buf;
	buffer_seek(r, buffer_seek_start, 0);
	repeat (argument2) {
	    var v = buffer_read(b, buffer_u8), c;
	    //
	    c = v & 15;
	    if (c >= 10) c += ord("A") - 10; else c += ord("0");
	    buffer_write(r, buffer_u8, c);
	    //
	    c = v >> 4;
	    if (c >= 10) c += ord("A") - 10; else c += ord("0");
	    buffer_write(r, buffer_u8, c);
	    //
	    buffer_write(r, buffer_u8, ord(" "));
	}
	//
	buffer_seek(r, buffer_seek_relative, -1);
	buffer_write(r, buffer_u8, 0);
	//
	buffer_seek(r, buffer_seek_start, 0);
	buffer_seek(b, buffer_seek_start, p);
	return buffer_read(r, buffer_string);



}
