bulletdir = ""
flag = 0
image_speed = 1.5
hspd = 0
vspd = 0
alarm[0] = 7
init = 1
atk = 1
spd = 0
target_spd = 7
timer = 12
iindex = 0
trail_particle = 19
if place_meeting(x, y, obj_wall)
{
    var count = 0
    var dir = 0
    if (obj_player.shootdir == 0 || obj_player.shootdir == 180)
        dir = 1
    var wall = instance_place(x, y, obj_wall)
    if (wall.open_hp != -1)
        wall.open_hp -= 1
    while place_meeting(x, y, obj_wall)
    {
        if dir
            x = approach(x, obj_player.x, 1)
        else
            y = approach(y, obj_player.y, 1)
        count++
        if (count > 8)
            break
        else
            continue
    }
}
audio_play_sound(snd_small_gun, 1, false)
audio_sound_pitch(snd_small_gun, random_range(0.9, 1.1))
