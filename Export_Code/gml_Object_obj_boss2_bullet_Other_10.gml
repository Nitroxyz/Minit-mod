if place_meeting(x, y, obj_wall)
{
    instance_destroy()
    instance_create(x, y, testobj_bulimp)
    return;
}
x += hspd
if (x < 0)
{
    instance_destroy()
    c_destroy = 1
}
