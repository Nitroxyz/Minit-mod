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
if (c_anim_index == "anim_crab_handsup_idle")
{
    if (flameobj == self)
    {
        state_timer = state_timer_o / 10
        flameobj = instance_create(obj_boss3.left_claw.x, (obj_boss3.left_claw.y - 10), obj_boss3_flamethrow_up)
        flameobj.par = obj_boss3.left_claw
        flameobj.timer += 90000
        flameobj.mag /= 3
    }
}
if (flameobj != self && (!(place_meeting((x + 16 * image_xscale), y, obj_wall))))
    x += image_xscale
else if (state_timer > 0)
    state_timer--
else
{
    if instance_exists(flameobj)
    {
        with (flameobj)
            instance_destroy()
        flameobj = -1
    }
    shake_screen(10)
    state_timer = state_timer_o / 10
    state = 602
}
