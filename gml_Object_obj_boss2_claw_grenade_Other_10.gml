hspd = lengthdir_x(spd, dir)
vspd = lengthdir_y(spd, dir)
spd = approach(spd, target_spd, accel)
if (spd == 0)
{
    instance_destroy()
    repeat (4)
    {
        var t = instance_create((x - 4 + irandom(8)), (y - 4 + irandom(8)), obj_water_bubble_catbreath)
        t.hspd = random_range(-1, 1)
        t.vspd = random_range(0, 1.5)
    }
    return;
}
x += hspd
y += vspd
image_speed = spd / 4
iindex += image_speed
