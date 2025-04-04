if (is_within_view(x, y, 0, 8) && timer > 0)
{
    x += hspd
    if place_meeting(x, y, obj_wall)
    {
        if (hspd == 0)
            hspd -= 0.6
        while place_meeting(x, y, obj_wall)
            x -= sign(hspd)
        hspd *= -0.9
        audio_play_sound(choose(352, 353, 354, 355), 100, false)
    }
    y += vspd
    if place_meeting(x, y, obj_wall)
    {
        if (vspd == 0)
            vspd -= 0.6
        while place_meeting(x, y, obj_wall)
            y -= sign(vspd)
        vspd *= -0.7
        if (vspd < 0 && vspd > -1)
            instance_destroy()
        else
            audio_play_sound(choose(352, 353, 354, 355), 100, false)
    }
    vspd += grav
    angle_raw -= (sign(hspd) * 6)
    image_angle = mround(angle_raw, 90)
    timer--
    if (timer < 80 && (timer % 6) == 0)
        visible = (!visible)
}
else
    instance_destroy()
