if (image_index < 3 && irandom(3) == 0)
    instance_destroy()
else
{
    visible = true
    if (irandom(1) == 0)
    {
        var child = instance_create((x + size / 2 * (choose(-1, 1))), (y + size / 2 * (choose(-1, 1))), obj_bubble)
        child.size = size / (random_range(1.5, 2))
        child.hspd = hspd / (0.8 + (random_range(-0.2, 0.2)))
        child.image_index = image_index + 0.6
        child.visible = false
        child.alarm[0] = ceil(child.image_index)
    }
}
