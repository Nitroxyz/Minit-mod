event_inherited()
atk = 2
enemy_null()
if (!((global.lava_cooled && MAP_MANAGER.map_current == "map3")))
{
    image_speed = 0.2
    hitsound = 189
    myid = instance_number(obj_fireball)
    touching_lava = 1
    submerged_timer = 10 + 30 * myid
    submerged_timer_max = 90
    tell_obj = -1
    target_y = ystart
    vspd = 0
    grav = 0.18
    burst_vspd = -4.2
    hangtime = 8
    hangtime_max = hangtime
    burst_ready = 1
    flip_ready = 1
}
else
{
    c_destroy = 1
    instance_destroy()
}
