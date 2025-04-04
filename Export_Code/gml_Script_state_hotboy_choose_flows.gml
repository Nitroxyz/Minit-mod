animate_custom()
if (choosetimer > 0)
{
    if (c_anim_queue == -1)
        c_anim_queue = anim_talk
    if (instance_number(obj_hotlava_flow) == 0)
        choosetimer--
    if (choosetimer == 20)
    {
        if (c_anim_index != anim_rocket_shoot && c_anim_index != anim_rocket_clench)
            c_anim_load_anim(anim_jump, anim_talk)
        else
            choosetimer++
    }
}
else if (choosecount > 0)
{
    choosetimer = choosetimermax
    choosecount--
    process_hotboy_stop_flow(0)
    process_hotboy_stop_flow(1)
    process_hotboy_stop_flow(2)
    process_hotboy_stop_flow(3)
    var flowact = irandom(3)
    var flowact2 = wrap((flowact + (choose(1, 2, 3))), 0, 4)
    flow[flowact].inactive_timer = 45
    flow[flowact2].inactive_timer = 45
    flow[flowact].flowhold = 1
    flow[flowact2].flowhold = 1
    if (obj_hotboy1.image_xscale == -1 && obj_custom9.hp < 50 && irandom(8) < 6)
        c_anim_load_anim(anim_rocket_clench, anim_rocket_shoot, 4)
}
else
{
    choosetimer = choosetimermax
    choosetimer += 60
    choosecount = choosecountmax
    process_hotboy_stop_flow(0)
    process_hotboy_stop_flow(1)
    process_hotboy_stop_flow(2)
    process_hotboy_stop_flow(3)
    flowact = irandom(1)
    flowact2 = clamp((flowact + (choose(2, 3))), 0, 3)
    flow[flowact].inactive_timer = 45
    flow[flowact2].inactive_timer = 45
    if (flow_repeat == 0)
    {
        flow_repeat = flow_repeat_max
        state = 598
        shootcount = 4
        shootcounter = 180
        image_speed = 0.2
        c_anim_load_anim(anim_clench)
        image_speed = 0.4
    }
    else
        flow_repeat--
}
