sprite_index = spr_sub_exit
image_speed = 1
if ((iindex + image_speed) >= image_number)
{
    if place_meeting(x, y, WATER)
        move_state = 72
    else
    {
        move_state = 70
        vspd = -2
    }
    vehicle = 0
    cat = 1
    sprite_index = spr_cat_idle
    var sub = instance_create(x, (y + 2), obj_vacant_sub)
    sub.cat_is_touching = 1
    sub.hp = global.sub_hp
    sub.depth = depth + 1
    sub.image_xscale = image_xscale
    mask_index = spr_cat_idle
    shoot_state = 2
    collision_state = 58
    with (obj_shootdoor)
    {
        if (state != 1)
        {
            state = 4
            timer = timer_max
        }
    }
}
