garypod_enginesound_mod()
if (hspd != 0)
{
    hspd = approach(hspd, 2, 0.1)
    if (x > 150)
    {
        x = approach(x, 240, hspd)
        if (x == 240 && y == (y_hover - 16))
        {
            hspd = 0
            shake_screen(20)
        }
    }
    else
    {
        x = approach(x, 64, hspd)
        if (x == 64 && y == (y_hover - 16))
        {
            hspd = 0
            shake_screen(20)
        }
    }
    y = approach(y, (y_hover - 16), hspd)
    machine.x = x
    machine.y = y + 49
    pod.x = x
    pod.y = y + 20
}
with (machine)
{
    if (sprite_index == spr_transform_machine)
    {
        iindex += 0.2
        if (iindex >= sprite_get_number(sprite_index))
        {
            sprite_index = spr_firing_machine
            iindex = 0
        }
    }
    else if (other.hspd == 0)
    {
        if (x > 150)
            other.hspd = -0.1
        else
            other.hspd = 0.1
        other.state = 665
        other.shoot_timer = other.shoot_timer_max * 3
    }
}
