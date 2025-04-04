global.isLoading = 1
global.loadbuff = buffer_create(1, buffer_grow, 1)
global.loadid = buffer_load_async(global.loadbuff, string(global.save_cur), 0, -1)
global.minit_time = global.playtime
