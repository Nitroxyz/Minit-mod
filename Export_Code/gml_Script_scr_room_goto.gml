global.allow_cat_doors = 0
global.suitroom = -1
with (all)
{
    event_perform(ev_other, ev_room_end)
    if (!persistent)
    {
        c_destroy = 1
        instance_destroy()
    }
}
var rm = global.current_room
if (argument_count > 0)
    rm = argument[0]
global.current_room = rm
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
if (!(ds_exists(MAP_MANAGER.map_loaded, 1)))
    process_mapmanager_load()
var mapdata = MAP_MANAGER.map_loaded
var roomdata = json_decode(ds_map_find_value(mapdata, rm))
var t_quest = ds_map_find_value(roomdata, "quest")
global.quest = t_quest
t_upopen = ds_map_find_value(roomdata, "upopen")
t_downopen = ds_map_find_value(roomdata, "downopen")
t_leftopen = ds_map_find_value(roomdata, "leftopen")
t_rightopen = ds_map_find_value(roomdata, "rightopen")
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
    var temp = instance_create(real(t_x), real(t_y), _obj)
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
if (!instance_exists(obj_camera))
    instance_create(0, 0, obj_camera)
obj_camera.x = -2
obj_camera.y = -2
obj_camera.xmin = -2
obj_camera.xmax = -2
obj_camera.ymin = -2
obj_camera.ymax = -2
var rmnum = string_copy(rm, 1, 4)
rmdir = 0
if (t_rightopen != "0")
{
    var rpush = 0
    scr_roompop_right(rmnum, rpush)
}
rmdir = 90
if (t_upopen != "0")
{
    var upush = 0
    scr_roompop_up(rmnum, upush)
}
rmdir = 180
if (t_leftopen != "0")
{
    var lpush = 0
    scr_roompop_left(rmnum, lpush)
}
rmdir = 270
if (t_downopen != "0")
{
    var dpush = 0
    scr_roompop_down(rmnum, dpush)
}
with (obj_lavatop)
{
    if (object_index != obj_hotlava && object_index != obj_hotlava_flow)
    {
        if (x <= (obj_camera.xmin + 16 + 2))
        {
            if (!(position_meeting((x - 16), y, obj_lavatop)))
            {
                var t_lava = instance_create((x - 16), y, obj_lavatop)
                t_lava.visible = false
            }
        }
        if (x >= (obj_camera.xmax + 292 + 2))
        {
            if (!(position_meeting((x + 16), y, obj_lavatop)))
            {
                t_lava = instance_create((x + 16), y, obj_lavatop)
                t_lava.visible = false
            }
        }
        if (y <= (obj_camera.ymin + 16 + 2))
        {
            if (!(position_meeting(x, (y - 16), obj_lavatop)))
            {
                t_lava = instance_create(x, (y - 16), obj_lavatop)
                t_lava.visible = false
            }
        }
        if (y >= (obj_camera.ymax + 180 + 2))
        {
            if (!(position_meeting(x, (y + 16), obj_lavatop)))
            {
                t_lava = instance_create(x, (y + 16), obj_lavatop)
                t_lava.visible = false
            }
        }
    }
}
var switch_r_right = instance_create((obj_camera.xmax + (__view_get(2, 0)) + 4), (obj_camera.ymin - 8), obj_switch_room)
switch_r_right.image_yscale = ((abs(obj_camera.ymax - obj_camera.ymin)) + 1) * (((__view_get(3, 0)) + 16) / 16)
switch_r_right.requirex = 1
switch_r_right.requirevx = 1
switch_r_right.dir = 0
var switch_r_down = instance_create((obj_camera.xmin - 8), (obj_camera.ymax + (__view_get(3, 0)) + 4), obj_switch_room)
switch_r_down.image_xscale = ((abs(obj_camera.xmax - obj_camera.xmin)) + 1) * (((__view_get(2, 0)) + 16) / 16)
switch_r_down.requirey = 1
switch_r_down.requirevy = 1
switch_r_down.dir = 270
var switch_r_left = instance_create((obj_camera.xmin - 20), (obj_camera.ymin - 8), obj_switch_room)
switch_r_left.image_yscale = ((abs(obj_camera.ymax - obj_camera.ymin)) + 1) * (((__view_get(3, 0)) + 16) / 16)
switch_r_left.requirex = -1
switch_r_left.requirevx = -1
switch_r_left.dir = 180
var switch_r_up = instance_create((obj_camera.xmin - 8), (obj_camera.ymin - 20), obj_switch_room)
switch_r_up.image_xscale = ((abs(obj_camera.xmax - obj_camera.xmin)) + 1) * (((__view_get(2, 0)) + 16) / 16)
switch_r_up.requirey = -1
switch_r_up.requirevy = -1
switch_r_up.dir = 90
if (obj_camera.xmin != -2 || obj_camera.xmax != -2 || obj_camera.ymin != -2 || obj_camera.ymax != -2)
{
    switch_r_up.roomcenter_flag = 0
    switch_r_down.roomcenter_flag = 0
    switch_r_left.roomcenter_flag = 0
    switch_r_right.roomcenter_flag = 0
}
if (global.quest != "-1")
{
    if (get_room_state() == 2)
        qu_set(asset_get_index(global.quest))
    else if (get_room_state() == 3)
    {
        qu_set(asset_get_index(global.quest))
        scr_clear_enemies()
        scr_clear_lockroom_doors()
    }
    else if (get_room_state() == 4)
        scr_clear_lockroom_doors()
    else
        scr_clear_lockroom_doors()
}
else if (get_room_state() == 4)
    scr_clear_lockroom_doors()
else if (get_room_state() == 1)
{
    scr_clear_enemies()
    scr_clear_lockroom_doors()
}
else if (get_room_state() == -1)
    set_room_state(0)
if (!instance_exists(obj_player))
{
    instance_create(global.spawn_x, global.spawn_y, obj_player)
    if (!global.editor)
    {
        with (obj_player)
        {
            if place_meeting(x, y, WATER)
            {
                if (MAP_MANAGER.map_current == "map1" && (!instance_exists(obj_item_altar)))
                {
                    obj_gun.visible = false
                    move_state = 79
                    shoot_state = 86
                    sprite_index = spr_player_sub
                    vehicle = 2
                    hspd = 0
                    vspd = 0
                    shooting = 0
                    cat = 0
                    old_move_state = 79
                    mask_index = spr_player_sub
                    image_speed = 0
                    if place_meeting(x, y, obj_wall)
                    {
                        if (!(place_meeting(x, (y - 8), obj_wall)))
                        {
                            while place_meeting(x, y, obj_wall)
                                y--
                        }
                        else if (!(place_meeting(x, (y + 8), obj_wall)))
                        {
                            while place_meeting(x, y, obj_wall)
                                y++
                        }
                    }
                    player_play()
                    collision_state = 78
                    UI_entersub()
                }
                else if (MAP_MANAGER.map_current == "map3")
                {
                    with (WATER)
                    {
                        c_destroy = 1
                        instance_destroy()
                    }
                }
            }
        }
    }
}
with (obj_changeroom)
    event_perform(ev_other, ev_room_start)
with (all)
{
    if (object_index != GAME_MANAGER && object_index != obj_changeroom)
        event_perform(ev_other, ev_room_start)
}
t_list = ds_list_create()
with (obj_wall2)
{
    ds_list_add(other.t_list, id)
    instance_deactivate_object(id)
}
with (obj_door1_U)
{
    ds_list_add(other.t_list, id)
    instance_deactivate_object(id)
}
with (obj_wall)
{
    if (x < (obj_camera.xmin + 16 + 2))
    {
        if ((!(position_meeting(x, (y - 16), obj_wall))) & (!(position_meeting((x - 16), y, obj_wall))))
        {
            var t = instance_create((x - 16), y, obj_wall)
            t.visible = false
        }
        if ((!(position_meeting(x, (y + 16), obj_wall))) & (!(position_meeting((x - 16), y, obj_wall))))
        {
            t = instance_create((x - 16), y, obj_wall)
            t.visible = false
        }
    }
    if (x > (obj_camera.xmax + 292 + 2))
    {
        if ((!(position_meeting(x, (y - 16), obj_wall))) & (!(position_meeting((x + 16), y, obj_wall))))
        {
            t = instance_create((x + 16), y, obj_wall)
            t.visible = false
        }
        if ((!(position_meeting(x, (y + 16), obj_wall))) & (!(position_meeting((x + 16), y, obj_wall))))
        {
            t = instance_create((x + 16), y, obj_wall)
            t.visible = false
        }
    }
    if (y < (obj_camera.ymin + 16 + 2))
    {
        if ((!(position_meeting((x - 16), y, obj_wall))) & (!(position_meeting(x, (y - 16), obj_wall))))
        {
            t = instance_create(x, (y - 16), obj_wall)
            t.visible = false
        }
        if ((!(position_meeting((x + 16), y, obj_wall))) & (!(position_meeting(x, (y - 16), obj_wall))))
        {
            t = instance_create(x, (y - 16), obj_wall)
            t.visible = false
        }
    }
    if (y > (obj_camera.ymax + 180 + 2))
    {
        if ((!(position_meeting((x - 16), y, obj_wall))) & (!(position_meeting(x, (y + 16), obj_wall))))
        {
            t = instance_create(x, (y + 16), obj_wall)
            t.visible = false
        }
        if ((!(position_meeting((x + 16), y, obj_wall))) & (!(position_meeting(x, (y + 16), obj_wall))))
        {
            t = instance_create(x, (y + 16), obj_wall)
            t.visible = false
        }
    }
}
for (var ii = 0; ii < ds_list_size(t_list); ii++)
    instance_activate_object(ds_list_find_value(t_list, ii))
ds_list_destroy(t_list)
if instance_exists(obj_player)
{
    if (obj_player.vehicle != 1)
    {
        if (global.suitroom != -1)
        {
            global.vacant_suit = instance_create(global.vacant_suit_x[MAP_MANAGER.map_num], global.vacant_suit_y[MAP_MANAGER.map_num], obj_vacant_suit)
            global.vacant_suit.image_xscale = global.vacant_suit_xscale[MAP_MANAGER.map_num]
            global.vacant_suit.sprite_index = spr_plr_vacant_suit
            global.vacant_suit.mask_index = global.vacant_suit.sprite_index
            global.vacant_suit.image_speed = 0
            if (global.suitroom != global.current_room)
            {
                var t_ax = string_copy(global.suitroom, 1, 2)
                var t_ay = string_copy(global.suitroom, 3, 2)
                var t_bx = string_copy(global.current_room, 1, 2)
                var t_by = string_copy(global.current_room, 3, 2)
                if (t_ax != t_bx)
                {
                    var numa = real(t_ax)
                    var numb = real(t_bx)
                    if (numa > numb)
                    {
                        while (numa > numb)
                        {
                            numa--
                            with (global.vacant_suit)
                                x += 304
                        }
                    }
                    else
                    {
                        while (numa < numb)
                        {
                            numa++
                            with (global.vacant_suit)
                                x -= 304
                        }
                    }
                }
                else if (t_ay != t_by)
                {
                    numa = real(t_ay)
                    numb = real(t_by)
                    if (numa > numb)
                    {
                        while (numa > numb)
                        {
                            numa--
                            with (global.vacant_suit)
                                y += 192
                        }
                    }
                    else
                    {
                        while (numa < numb)
                        {
                            numa++
                            with (global.vacant_suit)
                                y -= 192
                        }
                    }
                }
            }
            with (obj_vacant_suit)
                event_perform(ev_other, ev_room_start)
        }
    }
}
if ((MAP_MANAGER.map_current == "map3" && (!global.lava_cooled)) || instance_number(obj_hotlava) > 0 || instance_number(obj_lavaflow_source) > 0 || instance_number(obj_steam_cloud_generator) > 0)
{
    global.hot_room = 1
    if ((!global.lava_cooled) && (!audio_is_playing(snd_hotlava)))
        audio_play_sound(snd_hotlava, 100, true)
}
else
{
    global.hot_room = 0
    if audio_is_playing(snd_hotlava)
        audio_stop_sound(snd_hotlava)
}
if (instance_number(obj_enemy) > 0 && global.hassuit == "no")
{
    with (obj_enemy)
    {
        c_destroy = 1
        instance_destroy()
    }
}
switch MAP_MANAGER.map_current
{
    case "map0":
        if global.decoder_discovered
            MUSIC_MANAGER.current_main_theme = 32
        else if (global.hassuit == "no")
            MUSIC_MANAGER.current_main_theme = 0
        else
            MUSIC_MANAGER.current_main_theme = 1
        break
    case "map1":
        if (global.water_level == 3)
            MUSIC_MANAGER.current_main_theme = 16
        else
            MUSIC_MANAGER.current_main_theme = 15
        break
    case "map2":
        MUSIC_MANAGER.current_main_theme = 23
        break
    case "map3":
        if global.lava_cooled
            MUSIC_MANAGER.current_main_theme = 18
        else
            MUSIC_MANAGER.current_main_theme = 17
        break
    case "map4":
        MUSIC_MANAGER.current_main_theme = 20
        break
    case "map5":
        MUSIC_MANAGER.current_main_theme = 25
        break
    case "map6":
        if global.endgame
            MUSIC_MANAGER.current_main_theme = 2
        else if (!global.gary_defeated)
            MUSIC_MANAGER.current_main_theme = 27
        else
            MUSIC_MANAGER.current_main_theme = 2
        break
}

if (!minit_music_inactive())
{
    if (global.minit_music_mode == 1)
    {
        if (MUSIC_MANAGER.current_song_index != 420)
        {
            if (MUSIC_MANAGER.current_song_index == MUSIC_MANAGER.current_main_theme)
                music_write_main_track_position()
            music_play(musIntro)
            music_duck(1, 0)
        }
    }
    else
    {
        if (global.minit_music_mode == 2)
        {
            var new_music = MUSIC_MANAGER.mus_desert[global.minit_music_part]
            var old_music = MUSIC_MANAGER.mus_desert[MUSIC_MANAGER.current_minit_part]
        }
        else
        {
            new_music = MUSIC_MANAGER.mus_forest[global.minit_music_part]
            old_music = MUSIC_MANAGER.mus_forest[MUSIC_MANAGER.current_minit_part]
        }
        if (MUSIC_MANAGER.current_minit_part != global.minit_music_part && MUSIC_MANAGER.current_song_index != new_music)
        {
            if (MUSIC_MANAGER.current_song_index == MUSIC_MANAGER.current_main_theme)
                music_write_main_track_position()
            music_play(new_music)
            music_duck(1, 0)
            MUSIC_MANAGER.current_minit_part = global.minit_music_part
        }
        else if (MUSIC_MANAGER.current_song_index != old_music)
        {
            if (MUSIC_MANAGER.current_song_index == MUSIC_MANAGER.current_main_theme)
                music_write_main_track_position()
            music_play(old_music)
            music_duck(1, 0)
        }
    }
}
else if instance_exists(obj_save_point)
{
    with (obj_save_point)
    {
        if ((!mini) && play_save_music)
        {
            music_write_main_track_position()
            music_xfade(SaveSong, 2000)
        }
        else if (MUSIC_MANAGER.current_song_index != MUSIC_MANAGER.current_main_theme)
            music_play_main(1)
    }
}
else if instance_exists(obj_orb)
{
    if obj_orb.play_item_music
    {
        music_write_main_track_position()
        music_xfade(snd_itemroom, 2000)
    }
    else if (obj_orb.other_music != -1)
    {
        music_write_main_track_position()
        music_xfade(obj_orb.other_music, 2000)
    }
}
else if (MUSIC_MANAGER.current_song_index != MUSIC_MANAGER.current_main_theme)
    music_play_main(1)
with (obj_controller)
    event_perform(ev_other, ev_user0)
