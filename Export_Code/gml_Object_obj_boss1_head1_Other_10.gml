event_inherited()
if (hp > 0)
    image_index = 3
else
{
    if instance_exists(obj_bullet)
    {
        with (obj_bullet)
            instance_destroy()
    }
    if instance_exists(obj_rocket)
    {
        with (obj_rocket)
            instance_destroy()
    }
    if instance_exists(obj_boss1)
    {
        obj_boss1.state = 2
        qu_set(231)
    }
}
