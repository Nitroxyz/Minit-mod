stun_state = 315
if (!helicopter_active)
{
    animate_actor()
    sprite_index = spr_helijumper_open
    if ((iindex + image_speed) >= image_number)
    {
        image_speed = 0
        iindex = image_number - 1
    }
    else
        image_speed = 0.2
    if (vspd >= helicopter_threshold)
    {
        helicopter_active = 1
        if (!has_used_helicopter)
            audio_play_sound(snd_helijumper_rev, 5, false)
        has_used_helicopter = 1
    }
}
else
{
    sprite_index = spr_helijumper_fly
    image_speed = 0.2
    animate_actor()
    vspd += helicopter_force
    if (helicopter_time > 0)
        helicopter_time--
    else
    {
        helicopter_active = 0
        sprite_index = spr_helijumper_open
        image_speed = 0
        iindex = image_number - 1
    }
}
if place_meeting(x, (y + 1), obj_wall)
{
    grounded = 1
    vspd = 0
    iindex = 0
    audio_play_sound(snd_trashcan_close, 5, false)
    has_used_helicopter = 0
    state = 396
}
else
    grounded = 0
if (!grounded)
    vspd += grav
if place_meeting((x + hspd), y, obj_wall)
{
    while (!(place_meeting((x + sign(hspd)), y, obj_wall)))
        x += sign(hspd)
    hspd = 0
    image_xscale *= -1
}
x += hspd
if place_meeting(x, (y + vspd), obj_wall)
{
    while (!(place_meeting(x, (y + sign(vspd)), obj_wall)))
        y += sign(vspd)
    vspd = 0
}
y += vspd
