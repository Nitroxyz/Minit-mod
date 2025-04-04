if (global.isSaving || global.isLoading)
    return;
global.world_height = 32
global.world_width = 32
var i = 0
var j = 0
global.room_state[0, 0] = 0
global.isSaving = 1
global.save_buffer = buffer_create(1, buffer_grow, 1)
var map = ds_map_create()
ds_map_add(map, "init", "0")
var map_cur = 0
var map_current_old = MAP_MANAGER.map_current
while file_exists("map" + string(map_cur))
{
    global.vacant_suit_room[map_cur] = -1
    global.vacant_suit_x[map_cur] = undefined
    global.vacant_suit_y[map_cur] = undefined
    global.vacant_suit_xscale[map_cur] = undefined
    ds_map_set(map, ("suit_room" + string(map_cur)), global.vacant_suit_room[map_cur])
    ds_map_set(map, ("suit_x" + string(map_cur)), global.vacant_suit_x[map_cur])
    ds_map_set(map, ("suit_y" + string(map_cur)), global.vacant_suit_y[map_cur])
    ds_map_set(map, ("suit_xscale" + string(map_cur)), global.vacant_suit_xscale[map_cur])
    var map_wrapper = process_mapmanager_load("map" + string(map_cur))
    for (var ti = 0; ti < global.world_width; ti++)
    {
        for (var tj = 0; tj < global.world_height; tj++)
        {
            var ti_s = (string_length(string(ti)) == 2 ? string(ti) : ("0" + string(ti)))
            var tj_s = (string_length(string(tj)) == 2 ? string(tj) : ("0" + string(tj)))
            var roomnumber = ti_s + tj_s
            if ds_map_exists(MAP_MANAGER.map_loaded, roomnumber)
            {
                var roomdata = json_decode(ds_map_find_value(MAP_MANAGER.map_loaded, roomnumber))
                var t_quest = ds_map_find_value(roomdata, "quest")
                if (t_quest != "-1")
                    ds_map_set(global.room_states[map_cur], roomnumber, 2)
                else
                    ds_map_set(global.room_states[map_cur], roomnumber, -1)
                ds_map_set(global.room_discovery[map_cur], roomnumber, -1)
                ds_map_destroy(roomdata)
            }
            else
            {
                ds_map_set(global.room_discovery[map_cur], roomnumber, -1)
                ds_map_set(global.room_states[map_cur], roomnumber, -1)
            }
        }
    }
    var map_cur_ds_string = json_encode(global.room_states[map_cur])
    ds_map_set(map, ("map" + string(map_cur)), map_cur_ds_string)
    map_cur_ds_string = json_encode(global.room_discovery[map_cur])
    ds_map_set(map, ("map_discovery" + string(map_cur)), map_cur_ds_string)
    map_cur++
}
process_mapmanager_load(map_current_old)
if (room != r_editor)
    global.hassuit = "no"
ds_map_add(map, "hassuit", global.hassuit)
ds_map_add(map, "water_level", 0)
ds_map_add(map, "lava_cooled", 0)
ds_map_add(map, "flows_cleared", 0)
ds_map_add(map, "vents_cleared", 0)
ds_map_add(map, "rocket_cost", 0.6)
ds_map_add(map, "spikewall_complete_0", 0)
ds_map_add(map, "spikewall_complete_1", 0)
ds_map_add(map, "lab_unlocked", 0)
for (var iii = 2; iii < 16; iii++)
{
    ds_map_add(map, ("palette" + string(iii)), 0)
    global.palette_unlocked[iii] = 0
}
global.max_hp = 6
ds_map_add(map, "maxhp", string(global.max_hp))
if (!global.editor)
{
    global.abilities = 0
    var roomtar = global.start_room
    var t_spawnx = "219"
    var t_spawny = "64"
    global.spawn_x = real(t_spawnx)
    global.spawn_y = real(t_spawny)
    ds_map_add(map, "map_start", "map0")
    ds_map_add(map, "room_start", roomtar)
    ds_map_add(map, "spawn_x", t_spawnx)
    ds_map_add(map, "spawn_y", t_spawny)
}
else
{
    global.abilities = global.editor_abilities
    roomtar = global.current_room
    ds_map_add(map, "room_start", roomtar)
    ds_map_add(map, "map_start", MAP_MANAGER.map_current)
    ds_map_add(map, "spawn_x", string(global.spawn_x))
    ds_map_add(map, "spawn_y", string(global.spawn_y))
}
global.playtime = 0
global.minit_time = 0
global.minit_active = 0
global.items_collected = 0
global.events_completed = 0
global.flows_cleared = 0
global.vents_cleared = 0
global.spikewall_complete_0 = 0
global.spikewall_complete_1 = 0
global.water_level = 0
global.lava_cooled = 0
global.rocket_cost = 0.6
global.palette_default = 0
global.vehicle = 0
global.decoder_discovered = 0
global.bigpc_discovered = 0
global.decoder_discovered = 0
global.decoder_complete = 0
global.lab_unlocked = 0
global.rebba_quest_discovered_1 = 0
global.rebba_quest_discovered_2 = 0
global.rebba_quest_complete_1 = 0
global.rebba_quest_complete_2 = 0
global.gary_defeated = 0
global.gunEquip = 0
global.endgame = 0
if ds_map_exists(map, "getlist")
    ds_map_delete(map, "getlist")
if ds_exists(global.getlist, 2)
    ds_list_clear(global.getlist)
else
    global.getlist = ds_list_create()
if ds_map_exists(map, "cutlist")
    ds_map_delete(map, "cutlist")
if ds_exists(global.cutlist, 2)
    ds_list_clear(global.cutlist)
else
    global.cutlist = ds_list_create()
set_default_music_vols()
global.start_room = roomtar
global.current_room = roomtar
var json_string = json_encode(map)
ds_map_destroy(map)
buffer_write(global.save_buffer, buffer_string, json_string)
global.saveid = buffer_save_async(global.save_buffer, global.save_cur, 0, buffer_get_size(global.save_buffer))
