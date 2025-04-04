global.dump_tool = 0
global.start_room = global.default_start_room
global.abilities = 0
global.editor = 0
global.file_path = ""
global.finalboss_dialogskip = 0
roomto = 11
instance_create(0, 0, MUSIC_MANAGER)
audio_stop_all()
music_play(CatroidTheme)
active = 1
cur = 0
cur_index = 0
save_choice[0] = 0
w = 426.6666666666667
h = 240
scale = 2
window_set_size((w * scale), (h * scale))
surface_resize(application_surface, w, h)
if (!(ds_exists(global.getlist, 2)))
    global.getlist = ds_list_create()
if (!(ds_exists(global.cutlist, 2)))
    global.cutlist = ds_list_create()
state = 0
cur = 0
cur_index = 0
save_choice[0] = 0
save_loaded = [0, 0, 0]
loadbuff1 = buffer_create(1, buffer_grow, 1)
buffer_async_group_begin("Save")
buffer_async_group_option("savepadindex", 0)
buffer_async_group_option("showdialog", 0)
buffer_async_group_option("slottitle", string("save0"))
buffer_load_async(loadbuff1, string("save0.ini"), 0, -1)
loadid1 = buffer_async_group_end()
loadbuff2 = buffer_create(1, buffer_grow, 1)
buffer_async_group_begin("Save")
buffer_async_group_option("savepadindex", 0)
buffer_async_group_option("showdialog", 0)
buffer_async_group_option("slottitle", string("save1"))
buffer_load_async(loadbuff2, string("save1.ini"), 0, -1)
loadid2 = buffer_async_group_end()
loadbuff3 = buffer_create(1, buffer_grow, 1)
buffer_async_group_begin("Save")
buffer_async_group_option("savepadindex", 0)
buffer_async_group_option("showdialog", 0)
buffer_async_group_option("slottitle", string("save2"))
buffer_load_async(loadbuff3, string("save2.ini"), 0, -1)
loadid3 = buffer_async_group_end()
max_selection = 4
