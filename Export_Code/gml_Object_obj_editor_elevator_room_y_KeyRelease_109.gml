if mouse_inside_region(x, y, (2 * sprite_width), sprite_height)
{
    prop_cur--
    if (prop_cur < 0)
        prop_cur = prop_max - 1
    var str = string(prop_cur)
    message = str
    if (string_length(str) < 2)
        str = "0" + str
    obj_editor.properties_roomtarget_y = str
}
