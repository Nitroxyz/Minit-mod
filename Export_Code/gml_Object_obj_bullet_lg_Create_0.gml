bulletdir = ""
flag = 0
image_speed = 0
hspd = 0
vspd = 0
alarm[0] = 7
init = 1
atk = 2
spd = 0
target_spd = 12
timer = 12
iindex = 0
trail_particle = 29
if collision_line(x, y, obj_player.x, obj_player.y, obj_wall, false, false)
{
    var count = 0
    var dir = 0
    if (obj_player.shootdir == 0 || obj_player.shootdir == 180)
        dir = 1
    if dir
        x = (x + obj_player.x) / 2
    else
        y = (y + obj_player.y) / 2
    if place_meeting(x, y, obj_wall)
    {
        var wall = instance_place(x, y, obj_wall)
        if (wall.open_hp != -1)
            wall.open_hp -= 1
        while place_meeting(x, y, obj_wall)
        {
            if dir
                x = approach(x, obj_player.x, 2)
            else
                y = approach(y, obj_player.y, 2)
            count++
            if (count > 8)
                break
            else
                continue
        }
    }
}
audio_play_sound(snd_large_gun, 1, false)
audio_sound_pitch(snd_large_gun, random_range(0.9, 1.1))
audio_play_sound(snd_small_gun, 1, false)
audio_sound_pitch(snd_small_gun, random_range(0.9, 1.1))
