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
        save_0 = "Save File 1"
        save_choice[0] = 0
    }
    else
    {
        var name = ds_map_find_value(map, "completion")
        save_0 = "Save File 1: " + name + "%"
        save_choice[0] = 1
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
        save_1 = "Save File 2"
        save_choice[1] = 0
    }
    else
    {
        name = ds_map_find_value(map, "completion")
        save_1 = "Save File 2: " + name + "%"
        save_choice[1] = 1
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
        save_2 = "Save File 3"
        save_choice[2] = 0
    }
    else
    {
        name = ds_map_find_value(map, "completion")
        save_2 = "Save File 3: " + name + "%"
        save_choice[2] = 1
    }
    ds_map_destroy(map)
    show_debug_message("read save1")
    save_loaded[2] = 1
    buffer_delete(loadbuff3)
}
