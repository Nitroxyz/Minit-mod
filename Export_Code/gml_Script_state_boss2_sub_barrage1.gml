var tcircle_x = circle_x - circle_r * cos(circle_angle) / 3
var tcircle_y = circle_y + circle_r * sin(circle_angle)
circle_angle += circle_angle_speed
circle_y = circle_ystart + 12 * sin(circle_angle)
if (circletimer > 0)
{
    sign_old = sign(sin(degtorad(dir)))
    var dist = point_distance(x, y, tcircle_x, tcircle_y)
    dir = point_direction(x, y, tcircle_x, tcircle_y)
    circletimer--
    spd = approach(spd, 2.2, 0.018)
    x = lerp(x, (x + (lengthdir_x(spd, dir))), 0.65)
    y = lerp(y, (y + (lengthdir_y(spd, dir))), 0.65)
    if (shoot_repeat > 0)
    {
        shoot_repeat--
        if (shoot_repeat == 0 && sprite_index != boss2_body_sub_hurt)
            sprite_index = boss2_body_sub
    }
    else if (sign_old != 0 && sign_old != sign(sin(degtorad(dir))))
    {
        process_boss2_sub_shoot()
        shoot_repeat = shoot_repeat_max
        if (iindex == 2)
            iindex = 0
        else
            iindex = 2
    }
    if ((circletimer % 56) == 0)
    {
        if (arm0.state == 2)
        {
            with (arm0)
                script_execute(choose(437, 436))
        }
        else if (arm2.state == 2)
        {
            with (arm2)
                script_execute(process_boss2_shootarm_fifth_grenade)
        }
        else if (arm1.state == 2)
        {
            with (arm1)
                script_execute(process_boss2_shootarm_fifth_grenade)
        }
        else if (arm3.state == 2)
        {
            with (arm3)
                script_execute(choose(437, 436))
        }
    }
    else if ((circletimer % 83) == 0)
    {
        if (arm3.state == 2)
        {
            with (arm3)
                script_execute(choose(437, 436))
        }
        else if (arm1.state == 2)
        {
            with (arm1)
                script_execute(choose(437, 436, 435))
        }
        else if (arm2.state == 2)
        {
            with (arm2)
                script_execute(choose(437, 436, 435))
        }
        else if (arm0.state == 2)
        {
            with (arm0)
                script_execute(choose(437, 436))
        }
    }
}
else if (x != xbegin || y != ystart)
{
    drifttimer--
    spd = lerp(spd, 1, 0.05)
    dir = point_direction(x, y, xbegin, ystart)
    x = approach(x, xbegin, lengthdir_x(spd, dir))
    y = approach(y, ystart, abs(lengthdir_y(spd, dir)))
}
else
{
    process_boss2_begin_circle_barrage()
    iindex = 1
}
process_boss2_update_body_segments()
