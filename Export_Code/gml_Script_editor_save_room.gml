if (!(ds_exists(global.map_manager.map_loaded, 1)))
    process_mapmanager_load()
var map_wrapper = global.map_manager.map_loaded
if (!(ds_map_exists(map_wrapper, "default_room")))
    ds_map_add(map_wrapper, "default_room", "0808")
if (argument_count > 0)
    var roomnumber = argument[0]
else
    roomnumber = global.current_room
if ds_map_exists(map_wrapper, roomnumber)
    ds_map_delete(map_wrapper, roomnumber)
var wrapper = ds_map_create()
ds_map_add(wrapper, "quest", quest)
ds_map_add(wrapper, "upopen", (upopen ? "1" : "0"))
ds_map_add(wrapper, "downopen", (downopen ? "1" : "0"))
ds_map_add(wrapper, "leftopen", (leftopen ? "1" : "0"))
ds_map_add(wrapper, "rightopen", (rightopen ? "1" : "0"))
var t_doors = 0
if mapdoor_l
    t_doors = set_bitwise_flag(t_doors, 4, 1)
if mapdoor_u
    t_doors = set_bitwise_flag(t_doors, 2, 1)
if mapdoor_d
    t_doors = set_bitwise_flag(t_doors, 8, 1)
if mapdoor_r
    t_doors = set_bitwise_flag(t_doors, 1, 1)
if mapdoor_s
    t_doors = set_bitwise_flag(t_doors, 16, 1)
if mapdoor_e
    t_doors = set_bitwise_flag(t_doors, 32, 1)
ds_map_add(wrapper, "doors", t_doors)
var inst_cur = 0
for (var i = 0; i < real(map_width); i++)
{
    for (var j = 0; j < real(map_height); j++)
    {
        if (!(ds_map_empty(room_editor[i, j])))
        {
            var inst_wrapper = ds_map_create()
            var t_obj = ds_map_find_value(room_editor[i, j], "obj")
            ds_map_add(inst_wrapper, "obj", object_get_name(t_obj))
            ds_map_add(inst_wrapper, "spr", ds_map_find_value(room_editor[i, j], "spr"))
            ds_map_add(inst_wrapper, "layer", "player")
            ds_map_add(inst_wrapper, "image_xscale", string(ds_map_find_value(room_editor[i, j], "xscale")))
            ds_map_add(inst_wrapper, "image_yscale", string(ds_map_find_value(room_editor[i, j], "yscale")))
            ds_map_add(inst_wrapper, "i", string(i))
            ds_map_add(inst_wrapper, "j", string(j))
            ds_map_add(inst_wrapper, "direction", string(ds_map_find_value(room_editor[i, j], "rotation")))
            ds_map_add(inst_wrapper, "image_angle", string(ds_map_find_value(room_editor[i, j], "rotation")))
            ds_map_add(inst_wrapper, "id", string(ds_map_find_value(room_editor[i, j], "uid")))
            var obj = ds_map_find_value(room_editor[i, j], "obj")
            var xscale = ds_map_find_value(room_editor[i, j], "xscale")
            var yscale = ds_map_find_value(room_editor[i, j], "yscale")
            var rotation = ds_map_find_value(room_editor[i, j], "rotation")
            var spr = asset_get_index(ds_map_find_value(inst_wrapper, "spr"))
            var xoff = sprite_get_xoffset(spr)
            var yoff = sprite_get_yoffset(spr)
            var t_wid = sprite_get_width(spr)
            var t_hei = sprite_get_height(spr)
            var xdiff = t_wid / 2 - xoff
            var ydiff = t_hei / 2 - yoff
            var t_ang0 = point_direction(xoff, yoff, (t_wid / 2), (t_hei / 2))
            var t_dist = point_distance(xoff, yoff, (t_wid / 2), (t_hei / 2))
            var x_shift = lengthdir_x(t_dist, (t_ang0 + rotation + 180))
            var y_shift = lengthdir_y(t_dist, (t_ang0 + rotation + 180))
            ds_map_add(inst_wrapper, "x", string(8 + i * 16 + x_shift + xdiff))
            ds_map_add(inst_wrapper, "y", string(8 + j * 16 + y_shift + ydiff))
            var t_dsmap = -1
            if (!(is_undefined(ds_map_find_value(room_editor[i, j], "properties"))))
            {
                t_dsmap = ds_map_find_value(room_editor[i, j], "properties")
                var meth = 0
                var meth_stored = 0
                while (!(is_undefined(ds_map_find_value(t_dsmap, ("method" + string(meth))))))
                {
                    t_meth = ds_map_find_value(t_dsmap, ("method" + string(meth)))
                    if (t_meth != "scr_none")
                    {
                        ds_map_add(room_editor[i, j], ("method" + string(meth_stored)), t_meth)
                        meth_stored++
                    }
                    meth++
                }
            }
            meth = 0
            while (!(is_undefined(ds_map_find_value(room_editor[i, j], ("method" + string(meth))))))
            {
                ds_map_add(inst_wrapper, ("method" + string(meth)), ds_map_find_value(room_editor[i, j], ("method" + string(meth))))
                meth++
            }
            var inst_wrapper_string = json_encode(inst_wrapper)
            ds_map_destroy(inst_wrapper)
            ds_map_add(wrapper, ("inst" + string(inst_cur)), inst_wrapper_string)
            inst_cur++
            if (object_get_name(t_obj) == "obj_demo_end_elevator" || object_get_name(t_obj) == "obj_demo_end_elevator_big")
            {
                if ds_map_exists(wrapper, "maptarget")
                {
                    ds_map_replace(wrapper, "roomtarget_x", obj_editor.properties_roomtarget_x)
                    ds_map_replace(wrapper, "roomtarget_y", obj_editor.properties_roomtarget_y)
                    ds_map_replace(wrapper, "maptarget", obj_editor.properties_maptarget)
                }
                else
                {
                    ds_map_add(wrapper, "roomtarget_x", obj_editor.properties_roomtarget_x)
                    ds_map_add(wrapper, "roomtarget_y", obj_editor.properties_roomtarget_y)
                    ds_map_add(wrapper, "maptarget", obj_editor.properties_maptarget)
                }
            }
        }
    }
}
for (i = 0; i < real(map_width); i++)
{
    for (j = 0; j < real(map_height); j++)
    {
        if (!(ds_map_empty(room_editor_f[i, j])))
        {
            inst_wrapper = ds_map_create()
            t_obj = ds_map_find_value(room_editor_f[i, j], "obj")
            ds_map_add(inst_wrapper, "obj", object_get_name(t_obj))
            ds_map_add(inst_wrapper, "spr", ds_map_find_value(room_editor_f[i, j], "spr"))
            ds_map_add(inst_wrapper, "layer", "foreground")
            ds_map_add(inst_wrapper, "image_xscale", string(ds_map_find_value(room_editor_f[i, j], "xscale")))
            ds_map_add(inst_wrapper, "image_yscale", string(ds_map_find_value(room_editor_f[i, j], "yscale")))
            ds_map_add(inst_wrapper, "i", string(i))
            ds_map_add(inst_wrapper, "j", string(j))
            ds_map_add(inst_wrapper, "direction", string(ds_map_find_value(room_editor_f[i, j], "rotation")))
            ds_map_add(inst_wrapper, "image_angle", string(ds_map_find_value(room_editor_f[i, j], "rotation")))
            ds_map_add(inst_wrapper, "id", string(ds_map_find_value(room_editor_f[i, j], "uid")))
            obj = ds_map_find_value(room_editor_f[i, j], "obj")
            xscale = ds_map_find_value(room_editor_f[i, j], "xscale")
            yscale = ds_map_find_value(room_editor_f[i, j], "yscale")
            rotation = ds_map_find_value(room_editor_f[i, j], "rotation")
            spr = asset_get_index(ds_map_find_value(inst_wrapper, "spr"))
            xoff = sprite_get_xoffset(spr)
            yoff = sprite_get_yoffset(spr)
            t_wid = sprite_get_width(spr)
            t_hei = sprite_get_height(spr)
            xdiff = t_wid / 2 - xoff
            ydiff = t_hei / 2 - yoff
            t_ang0 = point_direction(xoff, yoff, (t_wid / 2), (t_hei / 2))
            t_dist = point_distance(xoff, yoff, (t_wid / 2), (t_hei / 2))
            x_shift = lengthdir_x(t_dist, (t_ang0 + rotation + 180))
            y_shift = lengthdir_y(t_dist, (t_ang0 + rotation + 180))
            ds_map_add(inst_wrapper, "x", string(8 + i * 16 + x_shift + xdiff))
            ds_map_add(inst_wrapper, "y", string(8 + j * 16 + y_shift + ydiff))
            t_dsmap = -1
            if (!(is_undefined(ds_map_find_value(room_editor_f[i, j], "properties"))))
            {
                t_dsmap = ds_map_find_value(room_editor_f[i, j], "properties")
                meth = 0
                meth_stored = 0
                while (!(is_undefined(ds_map_find_value(t_dsmap, ("method" + string(meth))))))
                {
                    t_meth = ds_map_find_value(t_dsmap, ("method" + string(meth)))
                    if (t_meth != "scr_none")
                    {
                        ds_map_add(room_editor_f[i, j], ("method" + string(meth_stored)), t_meth)
                        meth_stored++
                    }
                    meth++
                }
            }
            meth = 0
            while (!(is_undefined(ds_map_find_value(room_editor_f[i, j], ("method" + string(meth))))))
            {
                ds_map_add(inst_wrapper, ("method" + string(meth)), ds_map_find_value(room_editor_f[i, j], ("method" + string(meth))))
                meth++
            }
            inst_wrapper_string = json_encode(inst_wrapper)
            ds_map_destroy(inst_wrapper)
            ds_map_add(wrapper, ("inst" + string(inst_cur)), inst_wrapper_string)
            inst_cur++
        }
    }
}
var str = json_encode(wrapper)
ds_map_destroy(wrapper)
ds_map_add(map_wrapper, roomnumber, str)
str = json_encode(map_wrapper)
ds_map_destroy(map_wrapper)
save_file(global.map_manager.map_current, str)
