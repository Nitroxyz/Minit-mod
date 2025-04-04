if mouse_inside_region(x, y, (2 * sprite_width), sprite_height)
{
    prop_cur--
    if (prop_cur < 0)
        prop_cur = array_length_1d(property) - 1
    obj_editor.quest = property[prop_cur]
}
