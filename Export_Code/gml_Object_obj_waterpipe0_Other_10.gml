if active
{
    if (timer > 0)
        timer--
    else
    {
        timer = irandom(200) + 30
        if (instance_number(obj_drip) < 2)
            instance_create(x, (y + 2), obj_drip)
    }
}
