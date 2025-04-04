if (mouse_check_button_pressed(mb_left) && mouse_inside())
{
    if checked
    {
        checked = 0
        editor_set_property(method, "scr_none")
    }
    else
    {
        checked = 1
        editor_set_property(method, property)
    }
}
