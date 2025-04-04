animate_custom()
if place_meeting(x, (y - 24), obj_hotlava)
{
    vspd = approach(vspd, (-floatspeed), floatacc)
    y += vspd
}
else
{
    vspd = approach(vspd, fallspeed, grav)
    y += vspd
    if place_meeting(x, (y - 24), obj_hotlava)
        instance_create(x, y, obj_lavasplash)
}
if (state_timer > 0)
    state_timer--
else
{
    state_timer = state_timer_o / 2
    shoot_count = 3
    shoot_count_max = shoot_count
    image_speed = 0.25
    if (state_count > 0 && obj_custom0.hp > (obj_custom0.hp_max / 1.35))
    {
        state_count--
        process_activate_flameblocks()
        state = 608
        image_xscale *= -1
        target_x = xstart + 28 * image_xscale
        target_x_center = target_x
        angle = 0
        angle_speed = 0.20943951023931953
        with (obj_custom1)
            visible = true
        with (obj_custom2)
            visible = true
    }
    else
    {
        state_timer = 0
        if place_meeting((x + 32 * image_xscale), y, obj_wall)
        {
            if (!blast_created)
            {
                instance_create(0, 0, obj_fx7)
                blast_created = 1
                c_anim_load_anim("anim_crab_charging_lavaspray")
            }
            if (!instance_exists(obj_boss3_clawcharge))
            {
                process_activate_flameblocks()
                state = 604
                c_anim_load_anim("anim_crab_lavaspray")
                var t = instance_create(obj_boss3.left_claw.x, obj_boss3.left_claw.y, obj_hotlava_flow_beam_v)
                t.par = obj_boss3.left_claw
                with (t)
                    event_perform(ev_other, ev_room_start)
                t = instance_create(obj_boss3.right_claw.x, obj_boss3.right_claw.y, obj_hotlava_flow_beam_v)
                t.par = obj_boss3.right_claw
                with (t)
                    event_perform(ev_other, ev_room_start)
                vspd = 0
                image_xscale *= -1
                angle = 0
                angle_speed = 0.20943951023931953
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
            }
        }
        else
            x += image_xscale
    }
}
