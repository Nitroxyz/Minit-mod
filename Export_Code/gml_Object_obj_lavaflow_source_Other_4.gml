if (global.lava_cooled && MAP_MANAGER.map_current == "map3")
    instance_destroy()
else
{
    while (!(position_meeting(x, (y + flowcount * 16 + 16), obj_wall)))
    {
        flows[flowcount] = instance_create(x, (y + flowcount * 16 + 16), obj_hotlava_flow)
        flows[flowcount].iindex = flowcount
        flows[flowcount].fromsource = 1
        flows[flowcount].image_speed = 0.125
        instance_deactivate_object(flows[flowcount])
        flowcount++
    }
    flow_bottom = instance_create(x, y, obj_hotlava_flow_bottom)
    instance_deactivate_object(flow_bottom)
    flow_top = instance_create(x, y, obj_hotlava_flow_top)
    instance_deactivate_object(flow_top)
}
