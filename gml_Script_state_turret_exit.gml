sprite_index = spr_turret_exit
image_speed = 1
if ((iindex + image_speed) >= image_number)
{
    move_state = 70
    vehicle = 0
    cat = 1
    sprite_index = spr_cat_idle
    var sub = instance_create(x, y, obj_vacant_turret)
    sub.cat_is_touching = 1
    sub.depth = depth + 1
    sub.image_xscale = image_xscale
    sub.image_yscale = image_yscale
    image_yscale = 1
    mask_index = spr_cat_idle
    shoot_state = 2
}
