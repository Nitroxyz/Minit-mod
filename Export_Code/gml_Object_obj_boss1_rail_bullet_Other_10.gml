event_inherited()
y += vspd
image_yscale += 0.125
vspd += 0.25
if (image_index > 3.9)
    image_index = 4
var temp = instance_place(x, y, obj_wall)
if (temp != noone)
{
    if (endpt < 0)
        endpt = temp.y - 8
}
if (endpt > 0)
{
    if (endpt <= y)
        instance_destroy()
    else
    {
        if (!instance_exists(obj_shake))
        {
            instance_create((x + (random_range(-12, 12))), endpt, choose(87, 63))
            shake_screen(2)
        }
        if (!audio_is_playing(RailGunImpact))
        {
            audio_play_sound(RailGunImpact, 100, false)
            audio_sound_pitch(RailGunImpact, random_range(0.4, 0.5))
        }
    }
}
