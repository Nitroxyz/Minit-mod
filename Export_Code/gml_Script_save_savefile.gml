if (!instance_exists(obj_player))
    return;
if (!instance_exists(obj_save_point))
    global.cur_hp = global.max_hp
global.isSaving = 1
global.save_buffer = buffer_create(1, buffer_grow, 1)
var map = ds_map_create()
ds_map_set(map, "init", "1")
for (var map_cur = 0; map_cur < array_length_1d(global.room_states); map_cur++)
{
    ds_map_set(map, ("suit_room" + string(map_cur)), global.vacant_suit_room[map_cur])
    ds_map_set(map, ("suit_x" + string(map_cur)), global.vacant_suit_x[map_cur])
    ds_map_set(map, ("suit_y" + string(map_cur)), global.vacant_suit_y[map_cur])
    ds_map_set(map, ("suit_xscale" + string(map_cur)), global.vacant_suit_xscale[map_cur])
    var map_cur_ds_string = json_encode(global.room_states[map_cur])
    ds_map_set(map, ("map" + string(map_cur)), map_cur_ds_string)
    map_cur_ds_string = json_encode(global.room_discovery[map_cur])
    ds_map_set(map, ("map_discovery" + string(map_cur)), map_cur_ds_string)
}
if (MAP_MANAGER.map_current == "map1" && global.current_room == "2008")
{
    global.minit_music_mode = 1
    global.minit_music_part = 1
}
else if (MAP_MANAGER.map_current == "map1" && global.current_room == "2410")
{
    global.minit_music_mode = 2
    global.minit_music_part = 0
}
else if (MAP_MANAGER.map_current == "map6" && global.current_room == "2219")
{
    global.minit_music_mode = 3
    global.minit_music_part = 1
}
else
{
    global.minit_music_mode = 0
    global.minit_music_part = 0
}
global.room_start = global.current_room
ds_map_set(map, "map_start", MAP_MANAGER.map_current)
ds_map_set(map, "room_start", global.current_room)
ds_map_set(map, "palette_id", global.palette_default)
if (!global.center_player_position)
{
    ds_map_set(map, "spawn_x", string(obj_player.x))
    ds_map_set(map, "spawn_y", string(obj_player.y))
}
else
{
    ds_map_set(map, "spawn_x", "152")
    ds_map_set(map, "spawn_y", string(obj_player.y))
    global.center_player_position = 0
}
ds_map_set(map, "hassuit", global.hassuit)
ds_map_set(map, "maxhp", string(global.max_hp))
ds_map_set(map, "abilities", global.abilities)
ds_map_set(map, "gunequip", global.gunEquip)
ds_map_set(map, "collected", global.items_collected)
ds_map_set(map, "events", global.events_completed)
ds_map_set(map, "completion", string_format((100 * global.items_collected / 32), 1, 1))
ds_map_set(map, "playtime", global.playtime)
ds_map_set(map, "success", 0)
ds_map_set(map, "water_level", global.water_level)
ds_map_set(map, "lava_cooled", global.lava_cooled)
ds_map_set(map, "flows_cleared", global.flows_cleared)
ds_map_set(map, "vents_cleared", global.vents_cleared)
ds_map_set(map, "spikewall_complete_0", global.spikewall_complete_0)
ds_map_set(map, "spikewall_complete_1", global.spikewall_complete_1)
ds_map_set(map, "lab_unlocked", global.lab_unlocked)
ds_map_set(map, "gary_defeated", global.gary_defeated)
ds_map_set(map, "rocket_cost", global.rocket_cost)
ds_map_set(map, "vehicle", obj_player.vehicle)
ds_map_set(map, "decoder_discovered", global.decoder_discovered)
ds_map_set(map, "bigpc_discovered", global.bigpc_discovered)
ds_map_set(map, "decoder_discovered", global.decoder_discovered)
ds_map_set(map, "decoder_complete", global.decoder_complete)
ds_map_set(map, "rebba_quest_discovered_1", global.rebba_quest_discovered_1)
ds_map_set(map, "rebba_quest_discovered_2", global.rebba_quest_discovered_2)
ds_map_set(map, "rebba_quest_complete_1", global.rebba_quest_complete_1)
ds_map_set(map, "rebba_quest_complete_2", global.rebba_quest_complete_2)
for (var iii = 2; iii < 16; iii++)
    ds_map_set(map, ("palette" + string(iii)), global.palette_unlocked[iii])
if (!(ds_exists(global.getlist, 2)))
    global.getlist = ds_list_create()
if ds_map_exists(map, "getlist")
    ds_map_delete(map, "getlist")
var glist = ds_list_create()
ds_list_copy(glist, global.getlist)
ds_map_add_list(map, "getlist", glist)
if (!(ds_exists(global.cutlist, 2)))
    global.cutlist = ds_list_create()
if ds_map_exists(map, "cutlist")
    ds_map_delete(map, "cutlist")
var clist = ds_list_create()
ds_list_copy(clist, global.cutlist)
ds_map_add_list(map, "cutlist", clist)
var json_string = json_encode(map)
ds_map_destroy(map)
buffer_write(global.save_buffer, buffer_string, json_string)
global.saveid = buffer_save_async(global.save_buffer, global.save_cur, 0, buffer_get_size(global.save_buffer))
