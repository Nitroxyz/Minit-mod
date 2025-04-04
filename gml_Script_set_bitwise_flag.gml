var _enum = argument0
var _flag = argument1
var _io = argument2
if (_io == 1)
    _enum |= _flag
else
    _enum &= (~_flag)
return _enum;
