if (mask_index == tileset_mask_none)
{
    var t = instance_create(x, y, obj_foreground)
    t.sprite_index = sprite_index
    t.image_xscale = image_xscale
    t.image_yscale = image_yscale
    t.image_angle = image_angle
    c_destroy = 1
    instance_destroy()
}
