with (obj_enemy)
{
    if hide
    {
        hidecloud = instance_create(x, y, obj_hidecloud)
        hidecloud.parent = id
        hidecloud.depth = depth - 1
        hidecloud.image_xscale = image_xscale
        hidecloud.image_yscale = image_yscale
        visible = true
    }
    event_user(1)
}
