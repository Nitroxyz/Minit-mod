animate_custom()
y = approach(y, target_y, 1)
if (c_anim_index == "anim_crab_submerged_idle")
{
    with (obj_custom1)
        visible = false
    with (obj_custom2)
        visible = false
    if (y == target_y)
    {
        image_speed = 0.4
        with (obj_custom4)
            visible = false
        with (obj_custom5)
            visible = false
        with (obj_custom6)
            visible = false
        state_timer = state_timer_o
        image_xscale *= -1
        target_x = x
        while (!(place_meeting(target_x, y, obj_wall)))
            target_x -= image_xscale
        target_x += (16 * image_xscale)
        hspd = 0
        state = 603
    }
}
