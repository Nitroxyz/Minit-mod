garypod_enginesound_mod()
if (hspd != 0)
{
    hspd = approach(hspd, 2, 0.1)
    x = approach(x, x_hover, hspd)
    if (x == x_hover && y == y_hover)
    {
        hspd = 0
        shake_screen(20)
    }
    y = approach(y, y_hover, hspd)
    machine.x = x
    machine.y = y + 49
    pod.x = x
    pod.y = y + 20
}
with (machine)
{
    if (iindex != 0)
    {
        iindex -= 0.5
        if (iindex <= 0)
        {
            iindex = 0
            visible = false
        }
    }
    else if (other.hspd == 0)
    {
        other.angle = choose(0, 18.84955592153876)
        other.state = 663
        other.shoot_timer = other.shoot_timer_max
    }
}
