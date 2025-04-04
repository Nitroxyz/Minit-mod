if (flamm == self)
{
    if (timer > 0)
        timer--
    else
        flamm = instance_create(x, (y - 8), obj_bombflame_top)
}
else if (!instance_exists(flamm))
{
    flamm = -1
    timer = timer_max
}
