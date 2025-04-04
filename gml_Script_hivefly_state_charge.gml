image_speed = 0.25
sprite_index = spr_fly
animate_actor()
hspd += (image_xscale * acc)
x += hspd
y = ychargestart + sin(hspd) * 8
if (!audio_is_playing(flying_sfx))
{
    flying_sfx = audio_play_sound(fly_sound, 10, true)
    audio_sound_pitch(flying_sfx, random_range(0.9, 1.1))
}
else
    audio_sound_pitch(flying_sfx, (0.9 + abs(hspd) / 8))
var _min = (__view_get(0, 0)) - 24
var _max = (__view_get(0, 0)) + (__view_get(2, 0)) + 24
if (x < _min || x > _max)
    instance_destroy()
