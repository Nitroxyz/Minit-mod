var dist = point_distance(x, y, (circle_x + circle_r), circle_y)
var dir = point_direction(x, y, (circle_x + circle_r), circle_y)
if (dist < 28)
{
    if (dist < 4)
    {
        state = 445
        drifttimer = 35
        circletimer = 220
    }
    else
        spd = approach(spd, 1.5, 0.067)
}
else
    spd = approach(spd, 4, 0.043)
x = lerp(x, (x + (lengthdir_x(spd, dir))), 0.7)
y = lerp(y, (y + (lengthdir_y(spd, dir))), 0.7)
process_boss2_update_body_segments()
