if check_tube_state()
{
    if instance_exists(sidewall_a)
    {
        with (sidewall_a)
            instance_destroy()
    }
    if instance_exists(sidewall_b)
    {
        with (sidewall_b)
            instance_destroy()
    }
    for (var i = 0; i < 6; i++)
    {
        if instance_exists(water[i])
        {
            with (water[i])
                instance_destroy()
        }
    }
    iindex = 2
    if place_meeting(x, y, obj_frog)
    {
        var inst = instance_place(x, y, obj_frog)
        inst.state = 322
    }
}
