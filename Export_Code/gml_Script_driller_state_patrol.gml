sprite_index = spr_driller_patrol
image_speed = 0.2
stun_state = 317
animate_actor()
if is_within_view(x, y, 0, 16)
{
    if ((iindex % 4) == 1)
    {
        var t = audio_play_sound(snd_driller_footstep, 100, false)
        audio_sound_pitch(t, random_range(0.65, 0.78))
    }
}
if grounded
    vspd = 0
else
    vspd += 0.2
hspd = 0.25 * image_xscale
if place_meeting((x + hspd), y, obj_wall)
{
    while (!(place_meeting((x + sign(hspd)), y, obj_wall)))
        x += sign(hspd)
    image_xscale = (-image_xscale)
    hspd = 0
}
if (!(place_meeting((x + hspd), (y + 1), obj_wall)))
{
    image_xscale = (-image_xscale)
    hspd = 0
}
if instance_place((x + hspd), y, obj_flamebot)
{
    var o = instance_place((x + hspd), y, obj_flamebot)
    image_xscale = (-image_xscale)
    hspd = (-hspd)
    o.image_xscale *= -1
    o.hspd *= -1
}
x += hspd
if place_meeting(x, (y + vspd), obj_wall)
{
    while (!(place_meeting(x, (y + sign(vspd)), obj_wall)))
        y += sign(vspd)
    vspd = 0
}
y += vspd
if (x < (obj_camera.xmin + 12) || x > (obj_camera.xmax - 12 + 304))
{
    x = approach(x, (obj_camera.xmin + 150), 4)
    image_xscale *= -1
    hspd = 0.25 * image_xscale
}
if instance_exists(obj_player)
{
    var hit = 0
    if (instance_place(obj_player.x, y, obj_player) && sign(obj_player.x - x) == image_xscale)
    {
        hit = 1
        with (obj_driller_new)
        {
            if (state == 385 || state == 386)
                hit = 0
        }
    }
    if hit
    {
        state = 386
        hspd = 0
        vspd = 0
        iindex = 0
        return;
    }
}
