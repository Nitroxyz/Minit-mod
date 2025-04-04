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
        state_timer--
    else if (x != target_x)
    {
        x = approach(x, target_x, 1)
        if (((target_x - x) % 5) == 0)
        {
            var t = instance_create((x + (choose(1, -1)) * irandom(20)), y, obj_lavasplash)
            t = instance_create((t.x + (choose(1, -1)) * irandom(8)), (t.y + 16), obj_steam_cloud)
            t.vspd = 0
            t.hspd *= choose(0.3, -0.3)
        }
    }
    else if (c_anim_index == "anim_crab_submerged_idle")
    {
        c_anim_load_anim("anim_crab_submerged_equip_claws", "anim_crab_handsup_idle")
        shoot_count--
    }
    else if (c_anim_index == "anim_crab_handsup_idle")
        c_anim_queue = "anim_crab_shoot_left"
    else if (c_anim_index == "anim_crab_shoot_left")
    {
        if (shoot_count > 0)
        {
            shoot_count--
            c_anim_queue = "anim_crab_handsup_idle"
            state_timer = state_timer_o / 3
            image_xscale *= -1
            target_x = xstart + 28 * image_xscale
            target_x_center = target_x
        }
        else
        {
            state = 611
            c_anim_load_anim("anim_crab_submerged_retract_arms", "anim_crab_submerged_idle")
        }
    }
}
