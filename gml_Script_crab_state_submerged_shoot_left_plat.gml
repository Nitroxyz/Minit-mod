animate_custom()
if place_meeting(x, (y - 20), obj_hotlava)
{
    vspd = approach(vspd, (-floatspeed), floatacc)
    y += vspd
}
else
{
    vspd = approach(vspd, fallspeed, grav)
    y += vspd
    if place_meeting(x, (y - 20), obj_hotlava)
        instance_create(x, y, obj_lavasplash)
}
if (c_anim_queue == -1)
{
    if (state_timer > 0)
    {
        if (!(place_meeting((x - image_xscale * 32), y, obj_wall)))
            x -= image_xscale
        else
            image_xscale *= -1
        state_timer--
    }
    else
    {
        state_timer = state_timer_o
        if (obj_custom0.hp < (obj_custom0.hp_max / 2))
        {
            with (obj_custom1)
                visible = true
            with (obj_custom2)
                visible = true
            with (obj_custom4)
                visible = true
            with (obj_custom5)
                visible = true
            with (obj_custom6)
                visible = true
            target_x = xstart
            target_y = 96
            image_speed = 0.4
            image_xscale = 1
            state = 612
            c_anim_load_anim("anim_crab_jump_charge", "anim_crab_shoot_flows")
        }
        else
        {
            state = 611
            c_anim_load_anim("anim_crab_submerged_retract_arms", "anim_crab_submerged_idle")
        }
    }
}
