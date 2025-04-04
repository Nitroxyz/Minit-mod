if (!angle_initialized)
{
    grapple_direction += angle_offset
    angle_initialized = 1
}
ang_acc = -0.2 * dcos(grapple_direction)
ang_vel += ang_acc
grapple_direction += ang_vel
ang_vel *= damping
var tar_x = anchor_x + (lengthdir_x(length, grapple_direction))
var tar_y = anchor_y + (lengthdir_y(length, grapple_direction))
hspd = tar_x - x
vspd = tar_y - y
if place_meeting((x + hspd), (y + vspd), obj_wall)
{
    ang_vel = (-ang_vel) * 0.75
    tar_x = anchor_x + (lengthdir_x(length, grapple_direction))
    tar_y = anchor_y + (lengthdir_y(length, grapple_direction))
    hspd = tar_x - x
    vspd = tar_y - y
}
x += hspd
y += vspd
