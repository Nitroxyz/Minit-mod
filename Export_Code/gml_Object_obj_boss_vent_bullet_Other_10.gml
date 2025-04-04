hspd = lengthdir_x(spd, dir)
vspd = lengthdir_y(spd, dir)
spd = approach(spd, target_spd, spd_acc)
if (!(place_meeting((x + hspd), (y + vspd), obj_wall)))
{
    x += hspd
    y += vspd
}
else
{
    var t = instance_place((x + hspd), (y + vspd), obj_wall)
    if place_meeting(t.x, t.y, obj_bridgenode)
    {
        x += hspd
        y += vspd
    }
    else
        instance_destroy()
}
