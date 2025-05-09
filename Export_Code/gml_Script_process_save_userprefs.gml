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
