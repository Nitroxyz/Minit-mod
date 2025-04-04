global.world_height = 32
global.world_width = 32
global.editor = 1
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
global.water_level = ini_read_real("world", "water_level", 0)
global.lava_cooled = ini_read_real("world", "lava_cooled", 0)
global.flows_cleared = ini_read_real("world", "flows_cleared", 0)
global.vents_cleared = ini_read_real("world", "vents_cleared", 0)
global.spikewall_complete_0 = ini_read_real("world", "spikewall_complete_0", 0)
global.spikewall_complete_1 = ini_read_real("world", "spikewall_complete_1", 0)
global.rocket_cost = ini_read_real("world", "rocket_cost", 0.6)
global.lab_unlocked = ini_read_real("world", "lab_unlocked", 0)
ini_close()
global.max_hp = 7
global.hassuit = obj_editor.hassuit
global.name = "Kiki"
set_default_music_vols()
