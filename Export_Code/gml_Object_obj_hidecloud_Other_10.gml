animate_actor()
if (iindex == 0)
{
    if (parent != self)
    {
        with (parent)
            state = init_state
    }
    instance_destroy()
}
