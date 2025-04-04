vspd += grav
if (rot_timer > 0)
    rot_timer--
else
{
    rot_timer = rot_timer_max
    rot += (90 * sign(hspd))
    rot = wrap(rot, 0, 360)
    instance_create(x, y, obj_dust_cloud_walk)
}
x += hspd
y += vspd
if (!(is_within_view(x, y, 0, 16)))
    instance_destroy()
