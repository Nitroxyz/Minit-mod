var t_x = argument0
var t_y = argument1
x = t_x
y = t_y
arm_l.x = x + arm_l_off_x
arm_l.y = y + arm_l_off_y
arm_r.x = x + arm_r_off_x
arm_r.y = y + arm_r_off_y
leg_l.x = x + leg_l_off_x
leg_l.y = y + leg_l_off_y
leg_r.x = x + leg_r_off_x
leg_r.y = y + leg_r_off_y
if instance_exists(obj_boss1_head)
{
    head.x = x + head_off_x
    head.y = y + head_off_y
    head.ant.x = head.x + 3
    head.ant.y = head.y - 22
}
