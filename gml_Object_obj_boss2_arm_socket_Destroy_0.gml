if (!c_destroy)
{
    for (var i = 0; i < 28; i++)
    {
        with (armsegment[i])
            instance_destroy()
    }
    with (armwave_claw)
        instance_destroy()
    instance_create(x, y, obj_enemydeath_explosion)
}
