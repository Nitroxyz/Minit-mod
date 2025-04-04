if (state == 416)
{
    if (turretc_off > -8)
    {
        instance_create(x, (y + 16), obj_bubble)
        turretc_off -= 2
        alarm[2] = 4
    }
    else
        turretc_vis = 0
}
else if (state == 418 || state == 2)
{
    if (turretc_off < 3 && turretc_vis)
    {
        instance_create(x, (y + turretc_off + 16), obj_bubble)
        turretc_off += 2
        alarm[2] = 4
    }
}
else
{
    var flag = 0
    if (turretl_off != 0)
    {
        var temp = instance_create((arm_l.x - 12), arm_l.y, obj_bubble)
        temp.hspd = -1
        temp.vspd = 0
        temp.image_index = 3
        turretl_off -= sign(turretl_off)
        flag = 1
    }
    if (turretr_off != 0)
    {
        temp = instance_create((arm_r.x + 12), arm_r.y, obj_bubble)
        temp.hspd = 1
        temp.vspd = 0
        temp.image_index = 3
        turretr_off -= sign(turretr_off)
        flag = 1
    }
    if flag
        alarm[2] = 4
}
