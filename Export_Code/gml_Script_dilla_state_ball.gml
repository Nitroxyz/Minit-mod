sprite_index = spr_dilla_ball
image_speed = abs(hspd) * 0.1
if place_meeting(x, (y + 1), obj_wall)
{
    if (!grounded)
    {
        if (vspd > bounce_thresh)
            vspd = (-vspd) * 0.5
        else
        {
            grounded = 1
            vspd = 0
        }
    }
}
else
{
    grounded = 0
    vspd += grav
}
if (grounded && start_slowing)
    hspd = approach(hspd, 0, 0.02)
if place_meeting((x + hspd), y, obj_wall)
{
    while (!(place_meeting((x + sign(hspd)), y, obj_wall)))
        x += sign(hspd)
    if grounded
    {
        audio_play_sound(snd_dilla_hitwall, 100, false)
        state = 370
        hspd = (-image_xscale) * 2
        vspd = -1
        iindex = 0
        start_slowing = 0
        return;
    }
    else
    {
        audio_play_sound(snd_dilla_bounce, 100, false)
        hspd = (-hspd) * 0.5
        image_xscale = (-image_xscale)
        start_slowing = 1
    }
}
x += hspd
if place_meeting(x, (y + vspd), obj_wall)
{
    while (!(place_meeting(x, (y + sign(vspd)), obj_wall)))
        y += sign(vspd)
    vspd = 0
}
y += vspd
if (grounded && hspd == 0)
{
    state = 370
    iindex = 0
    return;
}
animate_actor()
