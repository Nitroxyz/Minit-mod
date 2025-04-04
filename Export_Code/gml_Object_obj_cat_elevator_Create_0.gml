image_speed = 0.4
x = room_width / 2
y = -48
yoff = 0
xoff = 0
iindex = 0
stage = 0
timer = 240
global.demo_item_count = 6
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
message_thankyou = "Thanks for playing the demo\nof GATO ROBOTO!"
message_completion = "Completion Rate: " + (string(round(global.items_collected / global.demo_item_count * 100))) + "%"
message_time = "Finish Time: " + _timestring
music = audio_play_sound(mu_elevator, 5, true)
audio_sound_gain(music, 0, 0)
audio_sound_gain(music, 1, 1000)
