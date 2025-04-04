if place_meeting(x, y, WATER)
{
    angle += angle_speed
    y = float_y + 3 * sin(angle)
    animate_actor()
}
else
    state = 322
