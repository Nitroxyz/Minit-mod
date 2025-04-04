if instance_exists(tube_container)
{
    if (tube_container.iindex == 2)
    {
        if place_meeting(x, y, WATER)
            state = 344
        else
            state = 346
    }
    else
    {
        angle += angle_speed
        y = float_y + 3 * sin(angle)
    }
    animate_actor()
}
else if place_meeting(x, y, WATER)
    state = 344
else
    state = 346
