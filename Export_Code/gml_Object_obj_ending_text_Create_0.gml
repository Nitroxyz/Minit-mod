global.controller_slot = 0
depth = -1000
var _timestring = ""
var _hours = (global.playtime div 3600) % 60
var _minutes = (global.playtime div 60) % 60
var _seconds = global.playtime % 60
_hours = string_format(_hours, 2, 0)
_hours = string_replace_all(_hours, " ", "0")
_minutes = string_format(_minutes, 2, 0)
_minutes = string_replace_all(_minutes, " ", "0")
_seconds = string_format(_seconds, 2, 0)
_seconds = string_replace_all(_seconds, " ", "0")
_timestring = _hours + ":" + _minutes + ":" + _seconds
message[0] = loc_read_line(588)
message[1] = loc_read_line(589) + " " + (string(round(100 * global.items_collected / 32))) + "%"
message[2] = loc_read_line(590) + " " + _timestring
state = 0
timer = 60
timer_max = 60
max_step = 3
cur_step = 0
sound[0] = 1
sound[1] = 0.8
sound[2] = 1.1
shake = [0, 0, 0]
