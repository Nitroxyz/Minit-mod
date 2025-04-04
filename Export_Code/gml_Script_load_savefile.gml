global.isLoading = 1
global.loadbuff = buffer_create(1, buffer_grow, 1)
global.loadid = buffer_load_async(global.loadbuff, string(global.save_cur), 0, -1)
minit_time_set()
global.minit_reset = 0
if (global.minit_music_mode > 1)
{
    global.minit_music_part++
    if (global.minit_music_part > 4)
        global.minit_music_part = 1
}
