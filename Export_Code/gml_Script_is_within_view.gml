var __x = argument0
var __y = argument1
var _viewID = argument2
var _padding = argument3
var _xview = __view_get(0, _viewID)
var _yview = __view_get(1, _viewID)
var __xmin = _xview - _padding
var __xmax = _xview + (__view_get(2, _viewID)) + _padding
var __ymin = _yview - _padding
var __ymax = _yview + (__view_get(3, _viewID)) + _padding
if (__x > __xmin && __x < __xmax && __y > __ymin && __y < __ymax)
    return 1;
return 0;
