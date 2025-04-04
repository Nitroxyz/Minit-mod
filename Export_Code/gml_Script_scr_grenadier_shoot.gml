var iindex_old = iindex
animate_actor()
if (iindex_old != iindex)
{
    if (iindex == 10)
    {
        shoot_count--
        if (shoot_count > -1)
        {
            var grenade = instance_create((x - 2 * dir), (y - 13), obj_grenade_grenadier)
            audio_play_sound(GrenadeLaunch, 100, false)
            if (shoot_count == 0)
                grenade.hspd *= -1
        }
    }
    else if (iindex == 0 && shoot_count == 0)
    {
        hspd = 0
        hspd_old = 0
        patrol_timer = patrol_timer_max
        state = 358
        sprite_index = spr_grenadier_walk
        shoot_count = 2
    }
}
