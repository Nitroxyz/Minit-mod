animate_custom()
if place_meeting(x, (y - 32), obj_hotlava)
{
    hspd = approach(hspd, 2, 0.05)
    vspd = approach(vspd, (-floatspeed), floatacc)
    y += vspd
}
else
{
    vspd = approach(vspd, fallspeed, grav)
    y += vspd
    if place_meeting(x, (y - 32), obj_hotlava)
        instance_create(x, y, obj_lavasplash)
}
if (abs(x - target_x) <= 2)
{
    hspd = 0
    state_timer = state_timer_o
    state = 609
    process_activate_flameblocks()
    c_anim_load_anim("anim_crab_submerged_equip_claws", "anim_crab_handsup_idle")
    flameobj = -1
    with (obj_custom1)
        visible = true
    with (obj_custom2)
        visible = true
}
else
    x = approach(x, target_x, hspd)
