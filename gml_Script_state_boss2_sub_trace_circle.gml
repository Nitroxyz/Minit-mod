var tcircle_x = circle_x + circle_r * cos(circle_angle)
var tcircle_y = circle_y + circle_r * sin(circle_angle)
circle_angle += circle_angle_speed
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
        if (iindex == 2)
            iindex = 0
        else
            iindex = 2
    }
    if (circletimer == 180)
    {
        if (circle_y == circle_ystart)
        {
            with (arm0)
                process_boss2_shootarm()
            with (arm3)
                process_boss2_shootarm()
        }
        else if (circle_y == (circle_ystart - 52))
        {
            with (arm2)
                process_boss2_shootarm_half_grenade()
            with (arm3)
                process_boss2_shootarm()
        }
        else
        {
            with (arm0)
                process_boss2_shootarm()
            with (arm1)
                process_boss2_shootarm_half_grenade()
        }
    }
    else if (circletimer == 60)
    {
        if (circle_y == circle_ystart)
        {
            with (arm1)
                process_boss2_shootarm_half_grenade()
        }
        else if (circle_y == (circle_ystart - 52))
        {
            with (arm0)
                process_boss2_shootarm_half_grenade()
        }
        else
        {
            with (arm3)
                process_boss2_shootarm_half_grenade()
        }
    }
}
else
{
    iindex = 0
    if (circle_y != (circle_ystart + 60))
    {
        if (circle_y == circle_ystart)
        {
            circle_angle_speed *= -1
            circle_x = 168
            circle_y = circle_ystart - 52
            state = 448
            dir = point_direction(xprevious, yprevious, x, y)
            circle_angle = 0
        }
        else
        {
            circle_x = 168
            circle_angle_speed *= -1
            circle_y = circle_ystart + 60
            state = 448
            dir = point_direction(xprevious, yprevious, x, y)
            circle_angle = 0
        }
    }
    else
    {
        circle_x = circle_xstart
        dist = point_distance(x, y, xbegin, ybegin)
        dir = point_direction(x, y, xbegin, ybegin)
        if (dist < 16)
        {
            if (dist < 4)
            {
                if (circle_angle_speed == circle_angle_speed_o)
                    circle_angle_speed = circle_angle_speed_o * 2
                else
                    circle_angle_speed = circle_angle_speed_o
                with (arm1)
                    process_boss2_shootarm_half_grenade()
                with (arm2)
                    process_boss2_shootarm_half_grenade()
                dir = point_direction(xprevious, yprevious, x, y)
                circle_y = circle_ystart
                circle_angle = 0
                x = xbegin
                y = ybegin
                spd = 0
                if (hp < 135)
                    process_boss2_begin_create_arm_shield()
                else
                    process_boss2_begin_sub_barrage1()
            }
            else
                spd = approach(spd, 1, 0.15)
        }
        else
            spd = approach(spd, 5, 0.025)
        x = lerp(x, (x + (lengthdir_x(spd, dir))), 0.65)
        y = lerp(y, (y + (lengthdir_y(spd, dir))), 0.65)
    }
}
process_boss2_update_body_segments()
