event_inherited()
body_offset = 0
xbegin = (__view_get(2, 0)) / 2
x = xbegin
head_off_x = -3
head_off_y = -10
head = instance_create((x - 3), (y - 10), obj_boss1_head)
hp_target = head.id
portrait = 357
mood = 0
arm_l_off_x = -11
arm_l_off_y = -6
arm_l = instance_create((x + arm_l_off_x), (y + arm_l_off_y), obj_boss1_arm)
arm_l.image_angle = 180
arm_l.image_xscale = 4
arm_r_off_x = 12
arm_r_off_y = -6
arm_r = instance_create((x + arm_r_off_x), (y + arm_r_off_y), obj_boss1_arm)
arm_r.image_angle = 0
arm_r.image_xscale = 4
turretfr = 0
turret_off = 0
shake_timer = 2
idle = 0
height = 24
leg_l_off_x = -6
leg_l_off_y = 11
leg_l = instance_create((x + leg_l_off_x), (y + leg_l_off_y), obj_boss1_leg)
leg_l.image_angle = 270
leg_l.image_xscale = height
leg_l.depth = depth + 1
leg_r_off_x = 6
leg_r_off_y = 11
leg_r = instance_create((x + leg_r_off_x), (y + leg_r_off_y), obj_boss1_leg)
leg_r.image_angle = 270
leg_r.image_xscale = height
leg_r.depth = depth + 1
scr_boss1_leg_height(height)
scr_boss1_body_move(x, (ystart - height))
init = 1
alarm[11] = 240
xtar = x
hspd = 0
ytar = y
vspd = -4
cur0 = 0
cur1 = 0
cur2 = 0
turretl_ang = 180
turretl_vis = 0
turretl_off = 0
turretr_ang = 0
turretr_vis = 0
turretr_off = 0
turretc_off = 0
turretc_ang = 270
turretc_vis = 0
state = 2
visible = false
arm_l.claw.visible = true
instance_deactivate_object(arm_l.claw)
arm_l.visible = false
arm_l.image_xscale = 0.33
instance_deactivate_object(arm_l)
arm_r.claw.visible = true
instance_deactivate_object(arm_r.claw)
arm_r.visible = false
arm_r.image_xscale = 0.33
instance_deactivate_object(arm_r)
leg_l.visible = false
leg_r.visible = false
instance_deactivate_object(leg_l.foot)
instance_deactivate_object(leg_r.foot)
instance_deactivate_object(leg_l)
instance_deactivate_object(leg_r)
railsound = -1
extendsound = -1
