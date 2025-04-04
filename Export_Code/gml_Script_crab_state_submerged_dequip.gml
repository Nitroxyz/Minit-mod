animate_custom()
if place_meeting(x, (y - 16), obj_hotlava)
{
    vspd = approach(vspd, (-floatspeed), floatacc)
    y += vspd
}
else
{
    vspd = approach(vspd, fallspeed, grav)
    y += vspd
    if place_meeting(x, (y - 16), obj_hotlava)
        instance_create(x, y, obj_lavasplash)
}
if (c_anim_index == "anim_crab_submerged_idle")
{
    with (obj_custom1)
        visible = false
    with (obj_custom2)
        visible = false
    with (obj_custom4)
        visible = false
    with (obj_custom5)
        visible = false
    with (obj_custom6)
        visible = false
    state_timer = state_timer_o * 1.3
    image_xscale *= -1
    target_x = x
    var y_old = y
    y = ystart
    while (!(place_meeting(target_x, y, obj_wall)))
        target_x -= image_xscale
    target_x += (32 * image_xscale)
    y = y_old
    hspd = 0
    state = 603
    blast_created = 0
}
