timer -= timer_speed
if (timer <= 0)
{
    if (timer_rep > 0)
    {
        timer_rep--
        timer = 1
    }
    else
        instance_destroy()
}
