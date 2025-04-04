idle += 0.08
var old_height = height
var new_y = y
height += (sin(idle) / 1.2)
if (abs(12 - height) > 12)
    height = lerp(height, 12, 0.05)
leg_l.image_xscale = height / 9
leg_r.image_xscale = height / 9
new_y = y + (old_height - height)
scr_boss1_body_move(x, new_y)
if (alarm[11] == 160)
{
    if (x < ((__view_get(2, 0)) * 0.66))
    {
        turretr_vis = 1
        var temp = instance_create((arm_r.x + 20), arm_r.y, obj_bubble)
        temp.image_index = 1
        temp.depth = depth + 1
        temp.hspd = 2
        temp.vspd = 0.5
    }
    if (x > ((__view_get(2, 0)) * 0.33))
    {
        turretl_vis = 1
        temp = instance_create((arm_l.x - 20), arm_l.y, obj_bubble)
        temp.image_index = 1
        temp.depth = depth + 1
        temp.hspd = -2
        temp.vspd = 0.5
    }
    body_offset = 1
}
else if (alarm[11] < 131 && alarm[11] > 100)
{
    if (turretfr == 0)
    {
        turretfr = 1
        turret_off = 1
    }
    else if (shake_timer > 0)
        shake_timer--
    else
    {
        shake_timer = 2
        turret_off = (!turret_off)
    }
}
else if (alarm[11] == 100)
{
    turret_off = 0
    turretfr = 2
    if turretr_vis
    {
        turretr_off = -2
        alarm[2] = 4
        temp = instance_create((arm_r.x + 20), arm_r.y, obj_bubble)
        temp.image_index = 1
        temp.depth = depth + 1
        temp.hspd = 2
        temp.vspd = -0.5
        temp = instance_create((arm_r.x + 20), arm_r.y, obj_bubble)
        temp.image_index = 2
        temp.depth = depth + 1
        temp.hspd = 1.5
        temp.vspd = 1
        temp = instance_create((arm_r.x + 20), arm_r.y, obj_boss1_grenade)
        temp.hspd = 1.6
        temp.vspd = -0.5
        body_offset = 2
    }
    if turretl_vis
    {
        turretl_off = -2
        alarm[2] = 4
        temp = instance_create((arm_l.x - 20), arm_l.y, obj_bubble)
        temp.image_index = 1
        temp.depth = depth + 1
        temp.hspd = -2
        temp.vspd = -0.5
        temp = instance_create((arm_l.x - 20), arm_l.y, obj_bubble)
        temp.image_index = 2
        temp.depth = depth + 1
        temp.hspd = -1.5
        temp.vspd = 1
        temp = instance_create((arm_l.x - 20), arm_l.y, obj_boss1_grenade)
        temp.hspd = -1.6
        temp.vspd = -0.5
        body_offset = 2
    }
    head.image_index = 1
}
else if (alarm[11] == 40)
{
    if turretr_vis
    {
        temp = instance_create((arm_r.x + 4), arm_r.y, obj_bubble)
        temp.image_index = 1
        temp.depth = depth + 1
        temp.hspd = 2
        temp.vspd = 0.5
        body_offset = 1
    }
    if turretl_vis
    {
        temp = instance_create((arm_l.x - 4), arm_l.y, obj_bubble)
        temp.image_index = 1
        temp.depth = depth + 1
        temp.hspd = -2
        temp.vspd = 0.5
        body_offset = 1
    }
    turretl_vis = 0
    turretr_vis = 0
    head.image_index = 0
}
if (turretfr > 1)
{
    turretfr += 0.1
    if (turretfr == 3)
        turretfr = 0
}
