if (submerged_timer > 0 && (!(is_within_view(x, y, 0, 16))))
{
    submerged_timer = 30 + 30 * myid
    return;
}
iindex_old = iindex
animate_actor()
if (submerged_timer > 0)
{
    submerged_timer--
    if (submerged_timer == 0)
    {
        vspd = burst_vspd
        if (tell_obj != self && instance_exists(tell_obj))
        {
            instance_destroy(tell_obj)
            tell_obj = -1
        }
    }
    else if (submerged_timer < 30)
    {
        if (tell_obj == -1)
            tell_obj = instance_create(x, y, obj_fireball_tell)
        if (irandom(4) == 0)
        {
            var tt = instance_create((x - 2 + random(4)), (y - 2 + random(4)), obj_steam_cloud)
            tt.hspd = choose(-1, 1, -0.6, 0.6)
            tt.vspd = 0.2
        }
    }
}
else if burst_ready
{
    y += vspd
    if ((!(position_meeting(x, (bbox_top + 4), obj_hotlava))) && touching_lava)
    {
        instance_create(x, y, obj_lavasplash)
        touching_lava = 0
        audio_play_sound(Splash, 5, false)
    }
    if (!(place_meeting(x, y, obj_hotlava)))
        burst_ready = 0
}
else if flip_ready
{
    if (vspd < 0)
    {
        vspd += grav
        if (vspd > -2 && sprite_index == spr_fireball_up)
        {
            sprite_index = spr_fireball_cd
            iindex = 0
        }
        if (vspd >= 0)
        {
            vspd = 0
            hangtime = 1
        }
        else
            y += vspd
    }
    else if (hangtime > 0)
    {
        if (iindex < iindex_old)
        {
            hangtime = 0
            sprite_index = spr_fireball_down
            iindex = 0
        }
    }
    else
    {
        flip_ready = 0
        vspd = 0
    }
}
else
{
    if (!touching_lava)
    {
        if place_meeting(x, y, obj_hotlava)
        {
            instance_create(x, y, obj_lavasplash)
            audio_play_sound(Splash, 5, false)
            touching_lava = 1
        }
    }
    vspd += grav
    y += vspd
    if (y > ystart)
    {
        sprite_index = spr_fireball_up
        y = ystart
        burst_ready = 1
        flip_ready = 1
        hangtime = hangtime_max
        submerged_timer = submerged_timer_max
    }
}
