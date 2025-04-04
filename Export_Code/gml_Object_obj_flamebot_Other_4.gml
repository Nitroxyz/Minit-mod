if (place_meeting(x, y, obj_wall) && (!(place_meeting(x, (y - 8), obj_wall))))
{
    while place_meeting(x, y, obj_wall)
        y--
}
