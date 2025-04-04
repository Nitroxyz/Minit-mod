if (!(is_within_view(x, y, 0, 16)))
    return;
dir++
dir = wrap(dir, 0, 360)
hspd = approach(hspd, lengthdir_x(spd, dir), 0.02)
vspd = approach(vspd, lengthdir_y(spd, dir), 0.02)
sprite_index = spr_pufferfish_swim
image_speed = 0.2
animate_actor()
if place_meeting((x + hspd), y, obj_wall)
{
    while (!(place_meeting((x + sign(hspd)), y, obj_wall)))
        x += sign(hspd)
    hspd = (-hspd) * 2
    process_play_swim_sound()
}
x += hspd
if place_meeting(x, (y + vspd), obj_wall)
{
    while (!(place_meeting(x, (y + sign(vspd)), obj_wall)))
        y += sign(vspd)
    vspd = (-vspd) * 2
    process_play_swim_sound()
}
y += vspd
if (hspd != 0)
    image_xscale = sign(hspd)
if (puff_timer > 0)
    puff_timer--
else
{
    puff_timer = 360
    stun_state = 317
    state = 341
    audio_play_sound(snd_pufferfish_puffup, 100, false)
    iindex = 0
}
if (!(place_meeting(x, y, WATER)))
{
    var _w = instance_nearest(x, y, WATER)
    if instance_exists(_w)
        instance_create(x, _w.bbox_top, obj_splash)
    state = 342
    puff_timer = 240
    audio_play_sound(Splash, 5, false)
}
