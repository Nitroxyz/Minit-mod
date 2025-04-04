name[save_id] = ""
fselect_text[save_id] = loc_read_line(555) + " " + (string(save_id + 1))
save_choice[save_id] = 0
fselect_func[save_id] = 635
fselect_hp[save_id] = 0
fselect_carts[save_id] = 0
process_tally_orbs_init(save_id)
file_delete("default/" + global.save_cur)
switch_save_end()
script_execute(titlemenu_fn_start)
