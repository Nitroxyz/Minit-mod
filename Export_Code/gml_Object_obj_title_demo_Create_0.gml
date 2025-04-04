depth = 0
macro_cur = 0
macro_savefile[0] = "save_preset_crab.ini"
macro_roomto[0] = 14
macro_map[0] = "map3"
macro_label[0] = "CRAB boss new"
macro_savefile[1] = "save_preset_lab.ini"
macro_roomto[1] = 14
macro_map[1] = "map5"
macro_label[1] = "LAB zone design"
macro_savefile[2] = "save_preset_vents.ini"
macro_roomto[2] = 14
macro_map[2] = "map4"
macro_label[2] = "VENT zone polished"
macro_savefile[3] = "save_preset_lava.ini"
macro_roomto[3] = 14
macro_map[3] = "map3"
macro_label[3] = "LAVA zone polished"
macro_savefile[4] = "save_preset_hub.ini"
macro_roomto[4] = 14
macro_map[4] = "map2"
macro_label[4] = "HUB zone design"
macro_savefile[5] = "save_preset_water.ini"
macro_roomto[5] = 14
macro_map[5] = "map1"
macro_label[5] = "WATER zone polished"
macro_savefile[6] = "nosavefileneeded"
macro_roomto[6] = 11
macro_map[6] = "map0"
macro_label[6] = "INTRO zone"
global.dump_tool = 0
global.editor = 0
global.file_path = ""
roomto = 11
audio_stop_all()
instance_create(0, 0, MUSIC_MANAGER)
music_play(CatroidTheme)
global.shake = 0
global.max_hp = 5
active = 1
cur = 0
cur_index = 0
save_choice[0] = 0
w = 426.6666666666667
h = 240
scale = 2
window_set_size((w * scale), (h * scale))
surface_resize(application_surface, w, h)
if file_exists("save0.ini")
    file_delete("save0.ini")
if (!(ds_exists(global.getlist, 2)))
    global.getlist = ds_list_create()
if (!(ds_exists(global.cutlist, 2)))
    global.cutlist = ds_list_create()
global.current_room = global.default_start_room
global.start_room = global.current_room
max_selection = 0
scenarios = -1
for (var i = 0; i < 32; i++)
{
    if script_exists(asset_get_index("process_scenario_" + string(max_selection)))
    {
        scenarios[max_selection] = asset_get_index("process_scenario_" + string(max_selection))
        max_selection++
    }
}
if (max_selection > 0)
    script_execute(scenarios[0])
