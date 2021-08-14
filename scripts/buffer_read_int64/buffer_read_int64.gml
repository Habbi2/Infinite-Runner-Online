/// @description  buffer_read_int64(buffer)
/// @param buffer
function buffer_read_int64(argument0) {
	var b = argument0;
	var i = buffer_read(b, buffer_u32);
	return i | (buffer_read(b, buffer_s32) << 32);



}
