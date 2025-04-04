if instance_exists(obj_menu_cat)
{
    if obj_menu_cat.inactive
        return;
    if place_meeting(x, (y - 1), obj_menu_cat)
    {
        if obj_menu_cat.grounded
        {
            if (!pressed)
            {
                pressed = 1
                audio_play_sound(snd_savepoint_stepon, 100, false)
            }
            iindex = 1
        }
    }
    else
    {
        if pressed
        {
            pressed = 0
            audio_play_sound(snd_savepoint_stepoff, 100, false)
        }
        iindex = 0
    }
}
