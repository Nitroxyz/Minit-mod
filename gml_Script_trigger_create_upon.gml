visible = false
if (!global.dump_tool)
{
    var trig = instance_create(x, y, obj_event_trigger)
    trig.create_id = object_index
    trig.parent_id = id
    trig.create_x = x
    trig.create_y = y
    trig.trigger = 127
    instance_deactivate_object(id)
}
else
{
    var meth_cur = array_length_1d(method)
    method[meth_cur] = "trigger_create_upon"
}
