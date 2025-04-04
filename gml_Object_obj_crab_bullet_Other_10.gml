animate_actor()
x = xstart + mag * sin(angle)
angle += angle_speed
mag = approach(mag, 12, 0.3)
if (place_meeting(x, (y + vspd), obj_wall) && y < 32)
{
    vspd = 0
    instance_destroy()
    return;
}
y += vspd
