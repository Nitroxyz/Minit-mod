if mouse_inside_region(x, y, (2 * sprite_width), sprite_height)
{
    prop_cur++
    if (prop_cur == array_length_1d(property))
        prop_cur = 0
    var maptarget = property[prop_cur]
    with (obj_editor)
        properties_maptarget = maptarget
}
