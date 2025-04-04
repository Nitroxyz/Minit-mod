garypod_enginesound_mod()
angle += angle_speed
y = y_hover + 28 * sin(angle)
pod.y = y + 20
x = x_hover + 120 * (sin(angle / 6))
pod.x = x
y_hover = approach(y_hover, 68, 0.25)
if (hp_last != hp)
{
    hp_lost_this_state += (hp_last - hp)
    hp_last = hp
}
if (shoot_timer > 0)
{
    if (muzzle_l > -1)
    {
        muzzle_l++
        if (muzzle_l == 5)
            muzzle_l = -1
    }
    if (muzzle_r > -1)
    {
        muzzle_r++
        if (muzzle_r == 5)
            muzzle_r = -1
    }
    if (shoot_timer <= 60)
    {
        if ((shoot_timer % 3) == 0)
        {
            if ((shoot_timer % 6) == 0)
            {
                instance_create((x - 11), (y + 55), obj_garypod_bullet)
                muzzle_l = 0
            }
            else
            {
                instance_create((x + 13), (y + 55), obj_garypod_bullet)
                muzzle_r = 0
            }
        }
    }
    shoot_timer--
}
else if (hp_lost_this_state >= 20)
{
    muzzle_r = -1
    muzzle_l = -1
    state = 670
    vspd = y - yprevious
    hspd = x - xprevious
    obj_boss_gary_pod.mask_index = spr_gary_pod_empty
    shoot_timer = shoot_timer_max * 2
}
else
    shoot_timer = shoot_timer_max
