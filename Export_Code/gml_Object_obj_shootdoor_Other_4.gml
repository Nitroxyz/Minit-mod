if (!(place_meeting(x, y, obj_player)))
{
    bubble = instance_create((x - image_xscale * 3), y, obj_shootdoor_dummy)
    bubble.parent = id
    bubble.image_xscale = image_xscale
    bubble.image_yscale = image_yscale
    state = 1
}
else
{
    bubble = instance_create(x, y, obj_shootdoor_dummy)
    with (bubble)
        instance_destroy()
    state = 2
}
