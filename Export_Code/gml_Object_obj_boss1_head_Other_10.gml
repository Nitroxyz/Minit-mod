event_inherited()
script_execute(state)
if (alarm[0] > 0)
{
    alarm[0]--
    if ((alarm[0] % 3) == 0)
    {
        if (image_index == 3)
            image_index = 2
        else
            image_index = 3
    }
    if (alarm[0] == 0)
    {
        image_index = 0
        alarm[0] = -1
        stun = 0
    }
}
if (hpold != hp)
{
    hpold = hp
    if (hp > 1)
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
}
