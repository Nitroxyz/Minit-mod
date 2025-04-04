animate_actor()
if (iindex == 4)
{
    var fly = instance_create(x, (y - 12), obj_hivefly)
    fly.dad = id
    ds_list_add(myFlies, fly)
}
if (iindex == (image_number - 1))
{
    image_speed = 0.1
    sprite_index = spr_hive_idle
    state = 330
}
