if c_destroy
{
    for (instances_cur = array_length_1d(instances) - 1; instances_cur >= 0; instances_cur--)
    {
        var t = instances[instances_cur]
        if instance_exists(t)
        {
            instance_activate_object(t)
            t.c_destroy = 1
            with (t)
                instance_destroy()
        }
    }
    if (shootdoors != self)
    {
        for (var i = 0; i < array_length_1d(shootdoors); i++)
        {
            t = shootdoors[i]
            if instance_exists(t)
            {
                instance_activate_object(t)
                t.c_destroy = 1
                with (t)
                    instance_destroy()
            }
        }
    }
    for (i = 0; i < array_length_1d(sidewalls); i++)
    {
        if instance_exists(sidewalls[i])
        {
            with (sidewalls[i])
                instance_destroy()
        }
    }
}
