global.world_height = 32
global.world_width = 32
var i = 0
var j = 0
global.room_state[0, 0] = 0
ini_open(global.save_cur)
ini_write_string("save", "init", "0")
var map_cur = 0
var map_current_old = MAP_MANAGER.map_current
while file_exists("map" + string(map_cur))
{
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
    for (ti = 0; ti < global.world_width; ti++)
    {
        for (tj = 0; tj < global.world_height; tj++)
        {
            ti_s = (string_length(string(ti)) == 2 ? string(ti) : ("0" + string(ti)))
            tj_s = (string_length(string(tj)) == 2 ? string(tj) : ("0" + string(tj)))
            roomnumber = ti_s + tj_s
            var temp_state = string(ds_map_find_value(global.room_states[map_cur], roomnumber))
            ini_write_string(("map" + string(map_cur)), roomnumber, temp_state)
            var temp_discovery_state = string(ds_map_find_value(global.room_discovery[map_cur], roomnumber))
            ini_write_string(("map_discovery" + string(map_cur)), roomnumber, temp_discovery_state)
        }
    }
    map_cur++
}
process_mapmanager_load(map_current_old)
if (room != r_editor)
    global.hassuit = "no"
ini_write_string("player", "hassuit", global.hassuit)
ini_write_real("world", "water_level", 0)
ini_write_real("world", "lava_cooled", 0)
ini_write_real("world", "flows_cleared", 0)
ini_write_real("world", "vents_cleared", 0)
ini_write_real("world", "rocket_cost", 0.6)
ini_write_real("world", "spikewall_complete_0", 0)
ini_write_real("world", "spikewall_complete_1", 0)
ini_write_real("world", "lab_unlocked", 0)
for (var iii = 2; iii < 16; iii++)
    ini_write_real("palette", string(iii), 0)
global.max_hp = 6
ini_write_string("player", "maxhp", string(global.max_hp))
if (!global.editor)
{
    global.abilities = 0
    var roomtar = global.start_room
    var t_spawnx = "219"
    var t_spawny = "64"
    global.spawn_x = real(t_spawnx)
    global.spawn_y = real(t_spawny)
    ini_write_string("player", "map_start", "map0")
    ini_write_string("player", "room_start", roomtar)
    ini_write_string("player", "spawn_x", t_spawnx)
    ini_write_string("player", "spawn_y", t_spawny)
}
else
{
    global.abilities = global.editor_abilities
    roomtar = global.current_room
    ini_write_string("player", "room_start", roomtar)
    ini_write_string("player", "map_start", MAP_MANAGER.map_current)
    ini_write_string("player", "spawn_x", string(global.spawn_x))
    ini_write_string("player", "spawn_y", string(global.spawn_y))
}
global.items_collected = 0
global.events_completed = 0
global.flows_cleared = 0
global.vents_cleared = 0
global.spikewall_complete_0 = 0
global.spikewall_complete_1 = 0
global.water_level = 0
global.lava_cooled = 0
global.rocket_cost = 0.6
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
if ini_section_exists("getlist")
    ini_section_delete("getlist")
if ds_exists(global.getlist, 2)
    ds_list_clear(global.getlist)
else
    global.getlist = ds_list_create()
if ini_section_exists("cutlist")
    ini_section_delete("cutlist")
if ds_exists(global.cutlist, 2)
    ds_list_clear(global.cutlist)
else
    global.cutlist = ds_list_create()
ini_close()
set_default_music_vols()
global.start_room = roomtar
global.current_room = roomtar
