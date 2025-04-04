popx = argument1
popy = argument2
var rm = argument0
if (!(ds_exists(global.map_manager.map_loaded, 1)))
    process_mapmanager_load()
var mapdata = global.map_manager.map_loaded
var roomdata = json_decode(ds_map_find_value(mapdata, rm))
if (global.vacant_suit_room[MAP_MANAGER.map_num] == rm)
    global.suitroom = rm
ds_map_set(global.room_discovery[MAP_MANAGER.map_num], rm, 1)
var r_x = real(string_copy(rm, 1, 2))
var r_y = real(string_copy(rm, 3, 2))
var t_doors = ds_grid_get(global.minimap_doors, (r_x - MAP_MANAGER.minimap_wmin), (r_y - MAP_MANAGER.minimap_hmin))
var nextroom = rm
if get_bitwise_flag(t_doors, 8)
{
    var r_x_next = (string_length(string(r_x)) == 2 ? string(r_x) : ("0" + string(r_x)))
    var r_y_next = (string_length(string(r_y + 1)) == 2 ? string(r_y + 1) : ("0" + (string(r_y + 1))))
    nextroom = r_x_next + r_y_next
    if (ds_map_find_value(global.room_discovery[MAP_MANAGER.map_num], nextroom) == -1)
    {
        ds_map_delete(global.room_discovery[MAP_MANAGER.map_num], nextroom)
        ds_map_set(global.room_discovery[MAP_MANAGER.map_num], nextroom, 0)
    }
}
if get_bitwise_flag(t_doors, 2)
{
    r_x_next = (string_length(string(r_x)) == 2 ? string(r_x) : ("0" + string(r_x)))
    r_y_next = (string_length(string(r_y - 1)) == 2 ? string(r_y - 1) : ("0" + (string(r_y - 1))))
    nextroom = r_x_next + r_y_next
    if (ds_map_find_value(global.room_discovery[MAP_MANAGER.map_num], nextroom) == -1)
    {
        ds_map_delete(global.room_discovery[MAP_MANAGER.map_num], nextroom)
        ds_map_set(global.room_discovery[MAP_MANAGER.map_num], nextroom, 0)
    }
}
if get_bitwise_flag(t_doors, 4)
{
    r_x_next = (string_length(string(r_x - 1)) == 2 ? string(r_x - 1) : ("0" + (string(r_x - 1))))
    r_y_next = (string_length(string(r_y)) == 2 ? string(r_y) : ("0" + string(r_y)))
    nextroom = r_x_next + r_y_next
    if (ds_map_find_value(global.room_discovery[MAP_MANAGER.map_num], nextroom) == -1)
    {
        ds_map_delete(global.room_discovery[MAP_MANAGER.map_num], nextroom)
        ds_map_set(global.room_discovery[MAP_MANAGER.map_num], nextroom, 0)
    }
}
if get_bitwise_flag(t_doors, 1)
{
    r_x_next = (string_length(string(r_x + 1)) == 2 ? string(r_x + 1) : ("0" + (string(r_x + 1))))
    r_y_next = (string_length(string(r_y)) == 2 ? string(r_y) : ("0" + string(r_y)))
    nextroom = r_x_next + r_y_next
    if (ds_map_find_value(global.room_discovery[MAP_MANAGER.map_num], nextroom) == -1)
    {
        ds_map_delete(global.room_discovery[MAP_MANAGER.map_num], nextroom)
        ds_map_set(global.room_discovery[MAP_MANAGER.map_num], nextroom, 0)
    }
}
var t_quest = ds_map_find_value(roomdata, "quest")
if (t_quest != "-1")
    global.quest = t_quest
if (rmdir == 0)
    t_rightopen = ds_map_find_value(roomdata, "rightopen")
else if (rmdir == 90)
    t_upopen = ds_map_find_value(roomdata, "upopen")
else if (rmdir == 180)
    t_leftopen = ds_map_find_value(roomdata, "leftopen")
else if (rmdir == 270)
    t_downopen = ds_map_find_value(roomdata, "downopen")
if ds_map_exists(roomdata, "maptarget")
{
    global.elevator_maptarget = ds_map_find_value(roomdata, "maptarget")
    global.elevator_roomtarget = (ds_map_find_value(roomdata, "roomtarget_x")) + (ds_map_find_value(roomdata, "roomtarget_y"))
}
var inst_cur = 0
while ds_map_exists(roomdata, ("inst" + string(inst_cur)))
{
    var _map = json_decode(ds_map_find_value(roomdata, ("inst" + string(inst_cur))))
    var t_obj = ds_map_find_value(_map, "obj")
    var t_spr = ds_map_find_value(_map, "spr")
    var t_id = ds_map_find_value(_map, "id")
    var t_x = ds_map_find_value(_map, "x")
    var t_y = ds_map_find_value(_map, "y")
    var t_xscale = ds_map_find_value(_map, "image_xscale")
    var t_yscale = ds_map_find_value(_map, "image_yscale")
    var t_direction = ds_map_find_value(_map, "direction")
    var t_angle = ds_map_find_value(_map, "image_angle")
    var _obj = asset_get_index(t_obj)
    var temp = instance_create((real(t_x) + popx), (real(t_y) + popy), _obj)
    if (_obj == obj_tile)
    {
        var til = real(string_char_at(t_spr, 8))
        var t_pos = ds_list_find_value(global.tileset_masks[til], ds_list_find_index(global.tileset_sprites[til], t_spr))
        temp.sprite_index = asset_get_index(process_convert_tile_sprite(t_spr))
        switch t_pos
        {
            case 1:
                temp.mask_index = tileset_mask_angle
                break
            case 2:
                temp.mask_index = tileset_mask_angle2
                break
            case 3:
                temp.mask_index = tileset_mask_angle3
                break
            case 4:
                temp.mask_index = tileset_mask_angle4
                break
            case 5:
                temp.mask_index = tileset_mask_none
                temp.depth = -10
                break
        }

    }
    if (!instance_exists(temp))
        inst_cur++
    else
    {
        temp.uid = real(t_id)
        temp.image_xscale = real(t_xscale)
        temp.image_yscale = real(t_yscale)
        temp.direction = real(t_direction)
        temp.image_angle = real(t_angle)
        var meth = 0
        while ds_map_exists(_map, ("method" + string(meth)))
        {
            meth_id = ds_map_find_value(_map, ("method" + string(meth)))
            with (temp)
                script_execute(asset_get_index(other.meth_id))
            meth++
        }
        inst_cur++
        ds_map_destroy(_map)
    }
}
ds_map_destroy(roomdata)
