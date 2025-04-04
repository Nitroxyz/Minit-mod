if (get_room_state() != 2)
{
    instance_destroy()
    scr_clear_lockroom_doors()
    return;
}
iindex = 0
visible = false
active = 1
image_speed = 0.2
state = 616
state_timer = 180
state_timer_o = state_timer
state_count = 2
state_count_max = state_count
c_anim_initialize("anim_crab_submerged_idle")
c_anim_stun = "anim_crab_stun"
with (obj_custom1)
{
    visible = false
    depth = 11
}
with (obj_custom2)
{
    visible = false
    depth = 11
}
with (obj_custom3)
    depth = 9
with (obj_custom4)
{
    visible = false
    depth = 9
}
with (obj_custom5)
{
    visible = false
    depth = 9
}
with (obj_custom6)
{
    visible = false
    depth = 9
}
hspd = 0
vspd = 0
target_x = x
floatspeed = 0.5
floatacc = 0.0125
fallspeed = 0.6
grav = 0.06
shoot_count = 3
shoot_count_max = shoot_count
blast_created = 0
left_claw = self
right_claw = self
left_arm = -1
right_arm = -1
with (obj_custom1)
{
    if (x < obj_custom0.x)
        obj_boss3.left_claw = id
    else
        obj_boss3.right_claw = id
}
with (obj_custom2)
{
    if (x < obj_custom0.x)
    {
        obj_boss3.left_arm = id
        obj_boss3.left_claw.par = obj_boss3.left_arm
    }
    else
    {
        obj_boss3.right_arm = id
        obj_boss3.right_claw.par = obj_boss3.right_arm
    }
}
