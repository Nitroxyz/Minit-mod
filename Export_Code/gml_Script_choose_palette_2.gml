palette_id = 2
obj_controller.palette_desc = loc_read_line(497)
if (image_xscale == -1)
{
    palette_id += 7
    image_xscale = 1
    script_execute(asset_get_index("choose_palette_" + string(palette_id)))
}
