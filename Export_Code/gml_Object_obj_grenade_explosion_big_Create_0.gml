event_inherited()
image_speed = 0.25
image_xscale = choose(-1, 1)
var flag = 0
if position_meeting(x, (y + 16), obj_wall)
{
    if (!(position_meeting((x - 16), (y + 16), obj_wall)))
    {
        while position_meeting(x, (y + 16), obj_wall)
            x--
    }
    else if (!(position_meeting((x + 16), (y + 16), obj_wall)))
    {
        while position_meeting(x, (y + 16), obj_wall)
            x++
    }
    else if (!(position_meeting(x, y, obj_wall)))
    {
        while position_meeting(x, (y + 16), obj_wall)
            y--
    }
}
