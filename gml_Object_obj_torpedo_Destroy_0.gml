with (obj_wall)
{
    var d = abs(distance_to_object(other.id))
    if (d < 72)
    {
        var shk = 2 - 2 * d / 72
        shake_wall(shk)
    }
}
