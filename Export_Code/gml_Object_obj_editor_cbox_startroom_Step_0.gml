if (mouse_check_button_pressed(mb_left) && mouse_inside())
{
    if (!checked)
    {
        checked = 1
        event_perform(ev_other, ev_user8)
    }
}
