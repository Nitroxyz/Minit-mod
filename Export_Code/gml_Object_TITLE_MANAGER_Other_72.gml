var ident = ds_map_find_value(async_load, "id")
var status = ds_map_find_value(async_load, "status")
var error = ds_map_find_value(async_load, "error")
if (ident == loadid1)
{
    var buffstring = buffer_read(loadbuff1, buffer_string)
    var map = json_decode(buffstring)
    if is_undefined(ds_map_find_value(map, "init"))
        var str = "0"
    else
        str = ds_map_find_value(map, "init")
    show_debug_message("Save Init: " + str)
    if (str == "0")
    {
        name[0] = ""
        fselect_text[0] = loc_read_line(555) + " 1"
        save_choice[0] = 0
        fselect_func[0] = 635
        fselect_hp[0] = 0
        fselect_carts[0] = 0
        process_tally_orbs_init(0)
    }
    else
    {
        name[0] = ds_map_find_value(map, "completion")
        fselect_text[0] = loc_read_line(555) + " 1: " + name[0] + "%"
        save_choice[0] = 1
        fselect_func[0] = 636
        fselect_hp[0] = (real(ds_map_find_value(map, "maxhp"))) - 6
        fselect_carts[0] = process_tally_palettes_menu(map)
        process_tally_orbs(0, map)
    }
    ds_map_destroy(map)
    show_debug_message("read save1")
    save_loaded[0] = 1
    buffer_delete(loadbuff1)
}
if (ident == loadid2)
{
    buffstring = buffer_read(loadbuff2, buffer_string)
    map = json_decode(buffstring)
    if is_undefined(ds_map_find_value(map, "init"))
        str = "0"
    else
        str = ds_map_find_value(map, "init")
    show_debug_message("Save Init: " + str)
    if (str == "0")
    {
        name[1] = ""
        fselect_text[1] = loc_read_line(555) + " 2"
        save_choice[1] = 0
        fselect_func[1] = 635
        fselect_hp[1] = 0
        fselect_carts[1] = 0
        process_tally_orbs_init(1)
    }
    else
    {
        name[1] = ds_map_find_value(map, "completion")
        fselect_text[1] = loc_read_line(555) + " 2: " + name[1] + "%"
        save_choice[1] = 1
        fselect_func[1] = 636
        fselect_hp[1] = (real(ds_map_find_value(map, "maxhp"))) - 6
        fselect_carts[1] = process_tally_palettes_menu(map)
        process_tally_orbs(1, map)
    }
    ds_map_destroy(map)
    show_debug_message("read save2")
    save_loaded[1] = 1
    buffer_delete(loadbuff2)
}
if (ident == loadid3)
{
    buffstring = buffer_read(loadbuff3, buffer_string)
    map = json_decode(buffstring)
    if is_undefined(ds_map_find_value(map, "init"))
        str = "0"
    else
        str = ds_map_find_value(map, "init")
    show_debug_message("Save Init: " + str)
    if (str == "0")
    {
        name[2] = ""
        fselect_text[2] = loc_read_line(555) + " 3"
        save_choice[2] = 0
        fselect_func[2] = 635
        fselect_hp[2] = 0
        fselect_carts[2] = 0
        process_tally_orbs_init(2)
    }
    else
    {
        name[2] = ds_map_find_value(map, "completion")
        fselect_text[2] = loc_read_line(555) + " 3: " + name[2] + "%"
        save_choice[2] = 1
        fselect_func[2] = 636
        fselect_hp[2] = (real(ds_map_find_value(map, "maxhp"))) - 6
        fselect_carts[2] = process_tally_palettes_menu(map)
        process_tally_orbs(2, map)
    }
    ds_map_destroy(map)
    show_debug_message("read save1")
    save_loaded[2] = 1
    buffer_delete(loadbuff3)
}
