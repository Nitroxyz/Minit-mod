if (!instance_exists(obj_player))
    return;
ini_open(global.save_cur)
for (var map_cur = 0; map_cur < array_length_1d(global.room_states); map_cur++)
{
    for (var ti = 0; ti < global.world_width; ti++)
    {
        for (var tj = 0; tj < global.world_height; tj++)
        {
            var ti_s = (string_length(string(ti)) == 2 ? string(ti) : ("0" + string(ti)))
            var tj_s = (string_length(string(tj)) == 2 ? string(tj) : ("0" + string(tj)))
            var roomnumber = ti_s + tj_s
            var temp_state = string(ds_map_find_value(global.room_states[map_cur], roomnumber))
            ini_write_string(("map" + string(map_cur)), roomnumber, temp_state)
            var temp_discovery_state = string(ds_map_find_value(global.room_discovery[map_cur], roomnumber))
            ini_write_string(("map_discovery" + string(map_cur)), roomnumber, temp_discovery_state)
        }
    }
}
ini_write_string("save", "init", "1")
global.room_start = global.current_room
ini_write_string("player", "map_start", MAP_MANAGER.map_current)
ini_write_string("player", "room_start", global.current_room)
ini_write_string("player", "spawn_x", string(obj_player.x))
ini_write_string("player", "spawn_y", string(obj_player.y))
ini_write_string("player", "hassuit", global.hassuit)
ini_write_string("player", "maxhp", string(global.max_hp))
ini_write_real("player", "abilities", global.abilities)
ini_write_real("player", "gunequip", global.gunEquip)
ini_write_real("save", "collected", global.items_collected)
ini_write_real("save", "events", global.events_completed)
ini_write_string("save", "completion", string_format((100 * (global.events_completed + global.items_collected) / 54), 1, 1))
ini_write_real("world", "water_level", global.water_level)
ini_write_real("world", "lava_cooled", global.lava_cooled)
ini_write_real("world", "flows_cleared", global.flows_cleared)
ini_write_real("world", "vents_cleared", global.vents_cleared)
ini_write_real("world", "spikewall_complete_0", global.spikewall_complete_0)
ini_write_real("world", "spikewall_complete_1", global.spikewall_complete_1)
ini_write_real("world", "lab_unlocked", global.lab_unlocked)
ini_write_real("world", "gary_defeated", global.gary_defeated)
ini_write_real("world", "rocket_cost", global.rocket_cost)
ini_write_real("world", "decoder_discovered", global.decoder_discovered)
ini_write_real("world", "bigpc_discovered", global.bigpc_discovered)
ini_write_real("world", "decoder_discovered", global.decoder_discovered)
ini_write_real("world", "decoder_complete", global.decoder_complete)
ini_write_real("world", "rebba_quest_discovered_1", global.rebba_quest_discovered_1)
ini_write_real("world", "rebba_quest_discovered_2", global.rebba_quest_discovered_2)
ini_write_real("world", "rebba_quest_complete_1", global.rebba_quest_complete_1)
ini_write_real("world", "rebba_quest_complete_2", global.rebba_quest_complete_2)
for (var iii = 2; iii < 16; iii++)
    ini_write_real("palette", string(iii), global.palette_unlocked[iii])
var i = 0
for (i = 0; i < ds_list_size(global.getlist); i++)
    ini_write_string("getlist", ("get" + string(i)), string(ds_list_find_value(global.getlist, i)))
i = 0
for (i = 0; i < ds_list_size(global.cutlist); i++)
    ini_write_string("cutlist", ("get" + string(i)), string(ds_list_find_value(global.cutlist, i)))
ini_close()
