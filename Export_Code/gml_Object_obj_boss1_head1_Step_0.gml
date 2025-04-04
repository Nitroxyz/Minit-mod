if (alarm[0] > 0)
{
    if ((alarm[0] % 3) == 0)
    {
        if (image_index == 3)
            image_index = 2
        else
            image_index = 3
    }
}
event_inherited()
