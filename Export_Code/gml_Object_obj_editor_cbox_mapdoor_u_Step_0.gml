if (mouse_check_button_pressed(mb_left) && mouse_inside())
{
    if (!checked)
    {
        checked = 1
        obj_editor.mapdoor_u = 1
    }
    else
    {
        checked = 0
        obj_editor.mapdoor_u = 0
    }
}
