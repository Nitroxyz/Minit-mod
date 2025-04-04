global.world_height = 32
global.world_width = 32
global.editor = 0
global.room_state[0, 0] = 0
ini_open(global.save_cur)
var map_target = ini_read_string("player", "map_start", MAP_MANAGER.map_current)
if (map_target != MAP_MANAGER.map_current)
    process_mapmanager_load(map_target)
var map_cur = 0
while file_exists("map" + string(map_cur))
{
    for (var ti = 0; ti < global.world_width; ti++)
    {
        for (var tj = 0; tj < global.world_height; tj++)
        {
            var ti_s = (string_length(string(ti)) == 2 ? string(ti) : ("0" + string(ti)))
            var tj_s = (string_length(string(tj)) == 2 ? string(tj) : ("0" + string(tj)))
            var roomnumber = ti_s + tj_s
            ds_map_set(global.room_states[map_cur], roomnumber, real(ini_read_string(("map" + string(map_cur)), roomnumber, "-1")))
            ds_map_set(global.room_discovery[map_cur], roomnumber, real(ini_read_string(("map_discovery" + string(map_cur)), roomnumber, "-1")))
        }
    }
    map_cur++
}
var roomtar = ini_read_string("player", "room_start", "0808")
var spawnx = ini_read_string("player", "spawn_x", "32")
var spawny = ini_read_string("player", "spawn_y", "64")
global.abilities = ini_read_real("player", "abilities", 0)
global.gunEquip = ini_read_real("player", "gunequip", 0)
global.max_hp = real(ini_read_string("player", "maxhp", "7"))
for (var iii = 2; iii < 16; iii++)
    global.palette_unlocked[iii] = ini_read_real("palette", string(iii), 0)
global.water_level = ini_read_real("world", "water_level", 0)
global.lava_cooled = ini_read_real("world", "lava_cooled", 0)
global.flows_cleared = ini_read_real("world", "flows_cleared", 0)
global.vents_cleared = ini_read_real("world", "vents_cleared", 0)
global.spikewall_complete_0 = ini_read_real("world", "spikewall_complete_0", 0)
global.spikewall_complete_1 = ini_read_real("world", "spikewall_complete_1", 0)
global.rocket_cost = ini_read_real("world", "rocket_cost", 0.6)
global.decoder_discovered = ini_read_real("world", "decoder_discovered", 0)
global.bigpc_discovered = ini_read_real("world", "bigpc_discovered", 0)
global.decoder_discovered = ini_read_real("world", "decoder_discovered", 0)
global.decoder_complete = ini_read_real("world", "decoder_complete", 0)
global.lab_unlocked = ini_read_real("world", "lab_unlocked", 0)
global.rebba_quest_discovered_1 = ini_read_real("world", "rebba_quest_discovered_1", 0)
global.rebba_quest_discovered_2 = ini_read_real("world", "rebba_quest_discovered_2", 0)
global.rebba_quest_complete_1 = ini_read_real("world", "rebba_quest_complete_1", 0)
global.rebba_quest_complete_2 = ini_read_real("world", "rebba_quest_complete_2", 0)
global.gary_defeated = ini_read_real("world", "gary_defeated", 0)
global.hassuit = ini_read_string("player", "hassuit", "no")
global.items_collected = ini_read_real("save", "collected", 0)
global.events_completed = ini_read_real("save", "events", 0)
ds_list_clear(global.getlist)
var getlist_i = "begin"
i = 0
while (getlist_i != "0")
{
    getlist_i = ini_read_string("getlist", ("get" + string(i)), "0")
    if (getlist_i != "0")
    {
        ds_list_add(global.getlist, getlist_i)
        i++
    }
}
ds_list_clear(global.cutlist)
var cutlist_i = "begin"
i = 0
while (cutlist_i != "0")
{
    cutlist_i = ini_read_string("cutlist", ("get" + string(i)), "0")
    if (cutlist_i != "0")
    {
        ds_list_add(global.cutlist, real(cutlist_i))
        i++
    }
}
global.name = ini_read_string("save", "name", "Kiki")
ini_close()
global.start_room = roomtar
global.current_room = roomtar
global.spawn_x = real(spawnx)
global.spawn_y = real(spawny)
set_default_music_vols()
