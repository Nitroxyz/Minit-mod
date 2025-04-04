audio_group_load(1)
global.playtime = 0
global.vacant_suit_room = -1
global.vacant_suit_x = undefined
global.vacant_suit_y = undefined
global.vacant_suit_xscale = undefined
global.finalboss_dialogskip = 0
global.center_player_position = 0
global.vehicle = 0
global.endgame = 0
global.allow_cat_doors = 0
global.feedback_test = 0
gamepad_set_axis_deadzone(0, 0.2)
global.controller_slot = 0
keybinding_set_to_defaults()
process_get_controller_type()
global.hudsurf = surface_create(304, 192)
global.minimap_data = -1
global.minimap_doors = -1
global.minimap_discovery = -1
global.getlist = ds_list_create()
global.cutlist = ds_list_create()
global.room_states = -1
global.room_discovery = -1
global.elevator_maptarget = "map0"
global.elevator_roomtarget = "0808"
global.default_start_room = "0808"
global.title_text = "press start"
global.save_preset = 0
global.palette_default = 0
global.abilities = 0
global.gunEquip = 0
global.palette_unlocked[0] = 1
for (var tp = 1; tp < 16; tp++)
    global.palette_unlocked[tp] = 0
global.palette_unlocked[1] = 1
global.palette_to_unlock = -1
global.rocket_cost = 0.6
global.hassuit = "yes"
global.items_collected = 0
global.water_level = 0
global.lava_cooled = 0
global.hot_room = 0
global.flows_cleared = 0
global.vents_cleared = 0
global.spikewall_complete_0 = 0
global.spikewall_complete_1 = 0
global.gary_defeated = 0
global.english_strings = load_csv("allenglishstrings.csv")
global.decoder_discovered = 0
global.bigpc_discovered = 0
global.decoder_discovered = 0
global.decoder_complete = 0
global.lab_unlocked = 0
global.rebba_quest_discovered_1 = 0
global.rebba_quest_discovered_2 = 0
global.rebba_quest_complete_1 = 0
global.rebba_quest_complete_2 = 0
if file_exists("userprefs.json")
{
    var json = data_manager_load_json("userprefs.json")
    global.MUSIC_MASTER_GAIN = real(ds_map_find_value(json, "MusicVol"))
    global.SOUND_MASTER_GAIN = real(ds_map_find_value(json, "SoundVol"))
    global.AUDIO_MASTER_GAIN = real(ds_map_find_value(json, "MasterVol"))
    global.fullscreen = real(ds_map_find_value(json, "Fullscreen"))
    global.language = real(ds_map_find_value(json, "Language"))
    if (!(is_undefined(ds_map_find_value(json, "up_key"))))
    {
        global.keybinding_up_key = real(ds_map_find_value(json, "up_key"))
        global.keybinding_down_key = real(ds_map_find_value(json, "down_key"))
        global.keybinding_left_key = real(ds_map_find_value(json, "left_key"))
        global.keybinding_right_key = real(ds_map_find_value(json, "right_key"))
        global.keybinding_jump_key = real(ds_map_find_value(json, "jump_key"))
        global.keybinding_shoot_key = real(ds_map_find_value(json, "shoot_key"))
        global.keybinding_rocket_key = real(ds_map_find_value(json, "rocket_key"))
        global.keybinding_dash_key = real(ds_map_find_value(json, "dash_key"))
        global.keybinding_eject_key = real(ds_map_find_value(json, "eject_key"))
        process_define_button_names()
    }
    else
    {
        global.keybinding_up_key = 38
        global.keybinding_down_key = 40
        global.keybinding_left_key = 37
        global.keybinding_right_key = 39
        global.keybinding_jump_key = 90
        global.keybinding_shoot_key = 88
        global.keybinding_rocket_key = 67
        global.keybinding_dash_key = 32
        global.keybinding_eject_key = 16
    }
    if (!(is_undefined(ds_map_find_value(json, "rumble"))))
        global.rumble = ds_map_find_value(json, "rumble")
    else
        global.rumble = 1
    ds_map_destroy(json)
}
else
{
    global.MUSIC_MASTER_GAIN = 1
    global.SOUND_MASTER_GAIN = 1
    global.AUDIO_MASTER_GAIN = 1
    global.fullscreen = window_get_fullscreen()
    global.rumble = 1
    global.keybinding_up_key = 38
    global.keybinding_down_key = 40
    global.keybinding_left_key = 37
    global.keybinding_right_key = 39
    global.keybinding_jump_key = 90
    global.keybinding_shoot_key = 88
    global.keybinding_rocket_key = 67
    global.keybinding_dash_key = 32
    global.keybinding_eject_key = 16
    process_get_os_language()
    var map = ds_map_create()
    ds_map_set(map, "MusicVol", global.MUSIC_MASTER_GAIN)
    ds_map_set(map, "SoundVol", global.SOUND_MASTER_GAIN)
    ds_map_set(map, "MasterVol", global.AUDIO_MASTER_GAIN)
    ds_map_set(map, "Fullscreen", global.fullscreen)
    ds_map_set(map, "Language", global.language)
    ds_map_set(map, "rumble", global.rumble)
    ds_map_set(map, "up_key", global.keybinding_up_key)
    ds_map_set(map, "down_key", global.keybinding_down_key)
    ds_map_set(map, "left_key", global.keybinding_left_key)
    ds_map_set(map, "right_key", global.keybinding_right_key)
    ds_map_set(map, "jump_key", global.keybinding_jump_key)
    ds_map_set(map, "shoot_key", global.keybinding_shoot_key)
    ds_map_set(map, "rocket_key", global.keybinding_rocket_key)
    ds_map_set(map, "dash_key", global.keybinding_dash_key)
    ds_map_set(map, "eject_key", global.keybinding_eject_key)
    save_file("userprefs.json", json_encode(map))
    ds_map_destroy(map)
}
window_set_fullscreen(global.fullscreen)
audio_master_gain(global.AUDIO_MASTER_GAIN)
ini_open("editorprefs.ini")
global.editor_map = ini_read_string("editor", "editor_map", "map0")
global.editor_room = ini_read_string("editor", "editor_room", "0808")
global.editor_spawn_x = ini_read_real("editor", "editor_spawn_x", 144)
global.editor_spawn_y = ini_read_real("editor", "editor_spawn_y", 72)
global.editor_abilities = real(ini_read_string("editor", "editor_abilities", "0"))
global.editor_start_cat = real(ini_read_string("editor", "editor_start_cat", "0"))
ini_close()
global.boss_hud_active = 0
global.boss_hud_target = -1
var map_cur = 0
while file_exists("map" + string(map_cur))
{
    global.room_states[map_cur] = ds_map_create()
    global.room_discovery[map_cur] = ds_map_create()
    map_cur++
}
