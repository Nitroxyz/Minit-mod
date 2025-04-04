hspd = lengthdir_x(spd, dir)
vspd = lengthdir_y(spd, dir)
image_angle = dir
if place_meeting((x + hspd), y, obj_wall)
{
    instance_destroy()
    instance_create((x + hspd), y, obj_bulimp_sm)
}
x += hspd
if place_meeting(x, (y + vspd), obj_wall)
{
    instance_destroy()
    instance_create(x, (y + vspd), obj_bulimp_sm)
}
y += vspd
