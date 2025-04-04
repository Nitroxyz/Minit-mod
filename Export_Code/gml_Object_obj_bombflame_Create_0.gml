event_inherited()
atk = 2
iindex = 0
image_speed = 0.25
hspd = 0
while place_meeting(x, y, obj_wall)
    y--
hasCreatedChild = 0
spinhurt = 1
var ttttt = instance_create(x, (y + 10), obj_bombflame_top)
ttttt.iindex = 2
ttttt.hspd *= sign(hspd)
audio_play_sound(snd_groundflame, 100, false)
