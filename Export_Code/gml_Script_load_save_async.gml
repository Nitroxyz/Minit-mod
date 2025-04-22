global.world_height = 32
global.world_width = 32
global.room_state[0, 0] = 0
var map_target = ds_map_find_value(loaded_data, "map_start")
if (map_target != MAP_MANAGER.map_current)
    process_mapmanager_load(map_target)
var map_cur = 0
while file_exists("map" + string(map_cur))
{
    global.vacant_suit_room[map_cur] = ds_map_find_value(loaded_data, ("suit_room" + string(map_cur)))
    global.vacant_suit_x[map_cur] = ds_map_find_value(loaded_data, ("suit_x" + string(map_cur)))
    global.vacant_suit_y[map_cur] = ds_map_find_value(loaded_data, ("suit_y" + string(map_cur)))
    global.vacant_suit_xscale[map_cur] = ds_map_find_value(loaded_data, ("suit_xscale" + string(map_cur)))
    if ds_exists(global.room_states[map_cur], 1)
        ds_map_destroy(global.room_states[map_cur])
    global.room_states[map_cur] = json_decode(ds_map_find_value(loaded_data, ("map" + string(map_cur))))
    if ds_exists(global.room_discovery[map_cur], 1)
        ds_map_destroy(global.room_discovery[map_cur])
    global.room_discovery[map_cur] = json_decode(ds_map_find_value(loaded_data, ("map_discovery" + string(map_cur))))
    map_cur++
}
var roomtar = ds_map_find_value(loaded_data, "room_start")
var spawnx = ds_map_find_value(loaded_data, "spawn_x")
var spawny = ds_map_find_value(loaded_data, "spawn_y")
global.abilities = ds_map_find_value(loaded_data, "abilities")
global.gunEquip = ds_map_find_value(loaded_data, "gunequip")
global.max_hp = real(ds_map_find_value(loaded_data, "maxhp"))
for (var iii = 2; iii < 16; iii++)
    global.palette_unlocked[iii] = ds_map_find_value(loaded_data, ("palette" + string(iii)))
global.water_level = ds_map_find_value(loaded_data, "water_level")
global.lava_cooled = ds_map_find_value(loaded_data, "lava_cooled")
global.flows_cleared = ds_map_find_value(loaded_data, "flows_cleared")
global.vents_cleared = ds_map_find_value(loaded_data, "vents_cleared")
global.spikewall_complete_0 = ds_map_find_value(loaded_data, "spikewall_complete_0")
global.spikewall_complete_1 = ds_map_find_value(loaded_data, "spikewall_complete_1")
global.rocket_cost = ds_map_find_value(loaded_data, "rocket_cost")
global.decoder_discovered = ds_map_find_value(loaded_data, "decoder_discovered")
global.bigpc_discovered = ds_map_find_value(loaded_data, "bigpc_discovered")
global.decoder_discovered = ds_map_find_value(loaded_data, "decoder_discovered")
global.decoder_complete = ds_map_find_value(loaded_data, "decoder_complete")
global.lab_unlocked = ds_map_find_value(loaded_data, "lab_unlocked")
global.rebba_quest_discovered_1 = ds_map_find_value(loaded_data, "rebba_quest_discovered_1")
global.rebba_quest_discovered_2 = ds_map_find_value(loaded_data, "rebba_quest_discovered_2")
global.rebba_quest_complete_1 = ds_map_find_value(loaded_data, "rebba_quest_complete_1")
global.rebba_quest_complete_2 = ds_map_find_value(loaded_data, "rebba_quest_complete_2")
global.gary_defeated = ds_map_find_value(loaded_data, "gary_defeated")
global.vehicle = ds_map_find_value(loaded_data, "vehicle")
global.endgame = ds_map_find_value(loaded_data, "success")
global.hassuit = ds_map_find_value(loaded_data, "hassuit")
global.items_collected = ds_map_find_value(loaded_data, "collected")
global.events_completed = ds_map_find_value(loaded_data, "events")
if ((!global.respawn_mode) && ds_map_exists(loaded_data, "playtime"))
    global.playtime = ds_map_find_value(loaded_data, "playtime")
var glist = ds_map_find_value(loaded_data, "getlist")
if ds_exists(global.getlist, 2)
    ds_list_clear(global.getlist)
ds_list_copy(global.getlist, glist)
var clist = ds_map_find_value(loaded_data, "cutlist")
if ds_exists(global.cutlist, 2)
    ds_list_clear(global.cutlist)
ds_list_copy(global.cutlist, clist)
global.palette_default = ds_map_find_value(loaded_data, "palette_id")
global.name = ds_map_find_value(loaded_data, "name")
global.start_room = roomtar
global.current_room = roomtar
global.spawn_x = real(spawnx)
global.spawn_y = real(spawny)
set_default_music_vols()
if (ds_map_exists(loaded_data, "minit_version") && ds_map_find_value(loaded_data, "minit_version") == global.minit_version)
    global.minit_active = ds_map_find_value(loaded_data, "minit_active")
else
    global.minit_active = 1
if (global.minit_mode > 0)
{
    if global.minit_active
        minit_time_set()
    if (!global.respawn_mode)
        minit_set_music()
    else if (global.minit_music_mode > 1)
    {
        global.minit_music_part++
        if (global.minit_music_part > 4)
            global.minit_music_part = 1
    }
}
