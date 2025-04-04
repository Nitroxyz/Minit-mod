room_speed = 60
menu_text = [loc_read_line(552), loc_read_line(553), loc_read_line(554)]
menu_functions = [633, 646, 634]
save_id = 0
camspeed = -2
new_game = 1
state = 0
loadbuff1 = buffer_create(1, buffer_grow, 1)
loadid1 = buffer_load_async(loadbuff1, string("save0.ini"), 0, -1)
loadbuff2 = buffer_create(1, buffer_grow, 1)
loadid2 = buffer_load_async(loadbuff2, string("save1.ini"), 0, -1)
loadbuff3 = buffer_create(1, buffer_grow, 1)
loadid3 = buffer_load_async(loadbuff3, string("save2.ini"), 0, -1)
fselect_text[3] = loc_read_line(549)
fselect_func[3] = 632
fselectoptions_text[0] = loc_read_line(557)
fselectoptions[0] = 632
fselectoptions_text[1] = loc_read_line(558)
fselectoptions[1] = 632
fselectoptions_text[2] = loc_read_line(549)
fselectoptions[2] = 633
if (!instance_exists(MUSIC_MANAGER))
    instance_create(0, 0, MUSIC_MANAGER)
audio_stop_all()
music_play(CatroidTheme)
cursor_index = 0
sub_cursor_index = 0
sub_entries = 3
entries = array_length_1d(menu_text)
buttons_last_frame = 0
sin_timer = 0
sfx_move_cursor = 149
snd_select_positive = 352
global.editor = 0
global.current_room = "0808"
global.start_room = "0808"
demo_hit_back = 0
