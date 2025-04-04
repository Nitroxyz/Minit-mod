if mouse_check_button_pressed(mb_left)
{
    if mouse_inside()
    {
        with (host)
            event_perform(ev_keypress, other.key_target)
        image_index = 1
    }
}
else if mouse_check_button(mb_left)
{
    if mouse_inside()
    {
        with (host)
        {
            event_perform(ev_keyboard, other.key_target)
            image_index = 1
        }
    }
}
else if mouse_check_button_released(mb_left)
{
    if mouse_inside()
    {
        with (host)
        {
            event_perform(ev_keyrelease, other.key_target)
            image_index = 0
        }
    }
}
else
    image_index = 0
