if place_meeting(x, (y + 1), obj_wall)
{
    vspd = 0
    grounded = 1
}
else
    grounded = 0
if (!grounded)
{
    vspd = min((vspd + 0.1), 8)
    if (vspd <= -0.5)
    {
        sprite_index = spr_squid_swim
        image_angle = 90
        draw_dir = 90
    }
    else if (vspd < -0.25)
    {
        sprite_index = spr_squid_swim_diag
        image_angle = 0
        draw_dir = 45
    }
    else if (vspd < 0.25)
    {
        sprite_index = spr_squid_swim
        image_angle = 0
        draw_dir = 0
    }
    else if (vspd < 0.5)
    {
        sprite_index = spr_squid_swim_diag
        image_angle = 270
        draw_dir = 315
    }
    else if (vspd > 0.5)
    {
        sprite_index = spr_squid_swim
        image_angle = 270
        draw_dir = 270
    }
    if place_meeting((x + hspd), y, obj_wall)
    {
        while (!(place_meeting((x + sign(hspd)), y, obj_wall)))
            x += sign(hspd)
        hspd = (-hspd)
        move_dir = point_direction(0, 0, hspd, vspd)
    }
    x += hspd
    if place_meeting(x, (y + vspd), obj_wall)
    {
        while (!(place_meeting(x, (y + sign(vspd)), obj_wall)))
            y += sign(vspd)
        vspd = (-vspd) * 0.25
        if (abs(vspd) < 0.25)
            vspd = 0
        move_dir = point_direction(0, 0, hspd, vspd)
    }
    y += vspd
}
else
{
    var ii = iindex
    if (iindex > 2 && image_speed != 0.2)
        image_speed = 0.2
    animate_actor()
    if (image_speed == 0 || ii > iindex)
    {
        var ss = audio_play_sound(snd_squidflop, 100, false)
        audio_sound_pitch(ss, random_range(0.85, 1.05))
        image_speed = random_range(0.04, 0.08)
    }
}
if place_meeting(x, y, WATER)
{
    var _w = instance_nearest(x, y, WATER)
    instance_create(x, _w.bbox_top, obj_splash)
    vspd *= 0.6
    state = 344
    swim_timer = 60
    audio_play_sound(Splash, 5, false)
}
