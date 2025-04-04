var _fname = argument0
var _string = ""
if file_exists(_fname)
{
    var _buffer = buffer_load(_fname)
    _string = buffer_read(_buffer, buffer_string)
    buffer_delete(_buffer)
}
var _json = json_decode(_string)
return _json;
