event_inherited()
vspd = 4
iindex = 0
image_speed = 1
destroyontouch = 1
image_angle = 270
var sfx = audio_play_sound(snd_shot, 5, false)
audio_sound_pitch(sfx, random_range(0.9, 1.1))
if place_meeting(x, y, obj_wall)
{
    if (x < 150)
    {
        while place_meeting(x, y, obj_wall)
            x++
    }
    else
    {
        while place_meeting(x, y, obj_wall)
            x--
    }
}
