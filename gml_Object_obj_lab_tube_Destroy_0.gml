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
if instance_exists(bottom)
{
    with (bottom)
        instance_destroy()
}
if instance_exists(top)
{
    with (top)
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
