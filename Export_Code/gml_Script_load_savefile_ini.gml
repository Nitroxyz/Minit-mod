global.isLoading = 1
global.loadbuff = buffer_create(1, buffer_grow, 1)
buffer_async_group_begin("Save")
buffer_async_group_option("savepadindex", 0)
buffer_async_group_option("showdialog", 0)
buffer_async_group_option("slottitle", string(global.save_cur))
buffer_load_async(global.loadbuff, string(global.save_cur), 0, -1)
global.loadid = buffer_async_group_end()
