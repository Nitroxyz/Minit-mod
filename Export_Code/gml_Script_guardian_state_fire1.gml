hspd = approach(hspd, (sign(hspd) * hspd_tar / 2), 0.1)
if place_meeting((x + hspd + sign(hspd) * 2), y, obj_wall)
{
    while (!(place_meeting((x + sign(hspd) + sign(hspd) * 2), y, obj_wall)))
        x += sign(hspd)
    hspd = (-hspd) * 0.5
}
x += hspd
var iindex_old = iindex
animate_actor()
if (iindex_old > iindex)
{
    if (bulletcount > 0)
    {
        var bullet = instance_create(x, (y + 20), obj_guardian_bullet)
        bullet.vspd = 2
        bullet.hspd = 0
        bulletcount--
    }
    else if (reloadcount > 1)
    {
        if (hp_lost_since_last_rocket >= 30)
        {
            if (sprite_index != spr_guardian_firing_rocket)
            {
                audio_play_sound(snd_guardian_transform_rocket, 5, false)
                state = 461
                sprite_index = spr_guardian_transform_rocket
                iindex = 0
                timer = 10
                image_speed = 0.2
            }
            return;
        }
        else
        {
            reloadcount--
            state = 460
            audio_play_sound(snd_guardian_machinegun_reload, 5, false)
            sprite_index = spr_guardian_reload_machine_gun
            timer = 0
            iindex = 0
            image_speed = 0.6
        }
    }
    else
    {
        iindex = 8
        if (hp < 40)
            timer = 150
        else
            timer = 200
        state = 457
    }
}
