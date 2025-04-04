var dix = 0
var diy = 0
repeat (room_height / 16)
{
    repeat (room_width / 16)
    {
        with (instance_create_depth(dix, diy, -10000, BlackFade))
            alarm[0] = (point_distance(x, y, other.x, other.y)) / 32 + 1
        dix += 16
    }
    dix = 0
    diy += 16
}
