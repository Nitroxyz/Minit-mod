if (abs(chosen_stop_angle - spin_angle) > 3 || spin_speed > 2)
{
    if (spin_angle > chosen_stop_angle)
    {
        spin_angle += spin_speed
        spin_angle = round(spin_angle)
    }
    else
    {
        spin_angle = approach(spin_angle, chosen_stop_angle, spin_speed)
        spin_angle = round(spin_angle)
    }
    spin_angle = wrap(spin_angle, 0, 360)
    spin_speed = approach(spin_speed, 1, 0.5)
}
else
{
    spin_angle = chosen_stop_angle
    spin_speed = 0
    if (stopped_timer > 0)
    {
        x = xstart + dsin(stopped_timer) * 16
        y = ystart + (dsin(stopped_timer / 2)) * 16
        stopped_timer--
    }
    else
    {
        state = 618
        stopped_timer = bullethell_timer
    }
}
for (var i = 0; i < 4; i++)
{
    var d = 90 * i + spin_angle
    shields[i].image_angle = d
    shields[i].x = x
    shields[i].y = y
}
