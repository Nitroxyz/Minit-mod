sprite_index = spr_pufferfish_outofwater
if place_meeting(x, (y + 1), obj_wall)
    grounded = 1
else
    grounded = 0
if grounded
{
    var ii = iindex
    if (iindex > 2 && image_speed != 0.2)
        image_speed = 0.2
    animate_actor()
    if (image_speed == 0 || ii > iindex)
    {
        var ss = audio_play_sound(snd_pufferfish_flop, 100, false)
        audio_sound_pitch(ss, random_range(0.85, 1.05))
        image_speed = 0.1
    }
    vspd = 0
    hspd = 0
}
else
{
    image_speed = 0
    iindex = 2
    vspd += 0.2
}
if place_meeting((x + hspd), y, obj_wall)
{
    while (!(place_meeting((x + sign(hspd)), y, obj_wall)))
        x += sign(hspd)
    hspd = 0
}
x += hspd
if place_meeting(x, (y + vspd), obj_wall)
{
    while (!(place_meeting(x, (y + sign(vspd)), obj_wall)))
        y += sign(vspd)
    vspd = 0
}
y += vspd
if place_meeting(x, y, WATER)
{
    var _w = instance_nearest(x, y, WATER)
    instance_create(x, _w.bbox_top, obj_splash)
    state = 340
    puff_timer = 240
    audio_play_sound(Splash, 5, false)
}
