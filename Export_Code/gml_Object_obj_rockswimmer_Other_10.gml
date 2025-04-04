var iindex_old = iindex
animate_actor()
if idling
{
    if (hspd == 0)
        hspd += acc
    else
    {
        hspd = approach(hspd, (target_speed * sign(hspd)), acc)
        image_xscale = sign(hspd)
    }
    process_rockswimmer_brickcheck()
    x += hspd
    if ((!touching_rock) && (!touching_rock_old))
    {
        diving_across = 1
        idling = 0
        diving_up = 0
        return;
    }
    if instance_exists(obj_player)
    {
        if (idletimer > 0)
            idletimer--
        else
        {
            var tdist = abs(obj_player.x - x)
            if (tdist < 40)
            {
                hspd = 0
                idling = 0
                hdir_old = sign(hspd)
                vspd = (-target_speed)
                diving_up = 1
                image_angle = 90
                image_xscale = 1
            }
        }
    }
}
else if diving_up
{
    process_rockswimmer_brickcheck()
    y += vspd
    if (vspd > -2)
    {
        if (sprite_index == spr_rockswimmer && image_xscale == 1)
        {
            sprite_index = spr_rockswimmer_cd
            iindex = 0
        }
        else if (sprite_index == spr_rockswimmer_cd)
        {
            if (iindex_old > iindex)
            {
                sprite_index = spr_rockswimmer
                iindex = 0
                image_xscale = -1
            }
        }
    }
    if (!touching_rock_old)
    {
        vspd += grav
        if touching_rock
        {
            y = (round(y / 16)) * 16 + 8
            image_angle = 0
            image_xscale = 0
            vspd = 0
            diving_up = 0
            idling = 1
            idletimer = 60
        }
    }
    else
    {
        vspd = approach(vspd, (-burst_speed), 0.1)
        if (!touching_rock)
            audio_play_sound(burst_sound, 5, false)
    }
}
else if diving_across
{
    x += (sign(image_xscale) * burst_speed)
    splode_timer--
    if (splode_timer <= 0)
    {
        instance_destroy()
        for (var ii = 0; ii < sprite_get_number(spr_rockswimmer_parts); ii++)
        {
            var tt = instance_create(x, y, obj_rockswimmer_particles)
            tt.hspd = hspd
            tt.image_xscale = image_xscale
            tt.iindex = ii
            tt.image_index = ii
        }
    }
}
dir_actual = point_direction(0, 0, hspd, vspd)
dir_rounded = mround(dir_actual, 90)
