down = 0
pressed = 0
released = 0
if mouse_inside()
{
    if mouse_check_button_pressed(mb_left)
        pressed = 1
    if mouse_check_button(mb_left)
        down = 1
    if mouse_check_button_released(mb_left)
        released = 1
}
if pressed
{
    with (target)
        event_perform(ev_keypress, other.key_id)
}
if released
{
    with (target)
        event_perform(ev_keyrelease, other.key_id)
}
if down
{
    with (target)
        event_perform(ev_keyboard, other.key_id)
}
