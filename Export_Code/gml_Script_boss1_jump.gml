height = 17
state = 420
head.image_index = 2
if (x < (0.33 * (__view_get(2, 0))))
    xtar = xstart
else if (x > (0.33 * (__view_get(2, 0))) && x < (0.66 * (__view_get(2, 0))))
{
    if (cur1 == 0)
    {
        xtar = xstart + 90
        cur1 = 1
    }
    else
    {
        xtar = xstart - 90
        cur1 = 0
    }
}
else
    xtar = xstart
create_particles(x, bbox_bottom, obj_dust_cloud_jump, random_range(2, 4))
var snd = audio_play_sound(snd_jumpair, 100, false)
audio_sound_pitch(snd, random_range(0.6, 0.7))
hspd = 4 * (sign(xtar - x))
xtar = x
ytar = y
vspd = -3.5
