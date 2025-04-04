if audio_is_playing(UIpausehum)
    audio_stop_sound(UIpausehum)
with (UI_MANAGER)
    state = other.previous_uistate
music_duck(ducklevel, 500)
if ds_exists(menu, 5)
    ds_grid_destroy(menu)
