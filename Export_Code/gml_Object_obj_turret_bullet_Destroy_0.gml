with (obj_wall)
{
    var d = point_distance(x, y, other.x, other.y)
    if (d < 72)
    {
        var shk = 6 - 6 * d / 72
        shake_wall(shk)
    }
}
with (obj_bridgenode)
{
    d = point_distance(x, y, other.x, other.y)
    if (d < 72)
    {
        shk = 6 - 6 * d / 72
        shake_wall(shk)
    }
}
