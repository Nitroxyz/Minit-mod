sprite_index = spr_helijumper_walk
stun_state = 317
animate_actor()
if place_meeting(x, (y + 1), obj_wall)
{
    grounded = 1
    vspd = 0
}
else
    grounded = 0
if grounded
{
    image_speed = 0.2
    hspd = image_xscale * 0.5
    vspd = 0
    if (timer > 0)
    {
        timer--
        if (timer < 10)
        {
            hspd = 0
            sprite_index = spr_helijumper_open
            iindex = 0
        }
    }
    else
    {
        vspd += jump_height
        iindex = 0
        sprite_index = spr_helijumper_open
        image_speed = 0.2
        has_used_helicopter = 0
        helicopter_active = 0
        grounded = 0
        audio_play_sound(snd_trashcan_open, 5, false)
        state = 395
    }
}
else
{
    vspd += grav
    image_speed = 0
}
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
