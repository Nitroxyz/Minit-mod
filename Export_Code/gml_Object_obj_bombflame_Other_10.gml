var iindex_old = floor(iindex)
animate_actor()
if ((iindex + image_speed) >= (image_number - 3) && (!hasCreatedChild))
{
    if ((!(place_meeting((x + hspd * 16), y, obj_wall))) && (place_meeting((x + hspd * 16), (y + 1), obj_wall) || place_meeting((x + hspd * 16), (y + 1), obj_bridgenode)))
    {
        var _child = instance_create((x + hspd * 16), y, obj_bombflame)
        _child.hspd = hspd
        hasCreatedChild = 1
        mask_index = spr_mask_none
    }
}
if ((iindex + image_speed) >= image_number)
    instance_destroy()
