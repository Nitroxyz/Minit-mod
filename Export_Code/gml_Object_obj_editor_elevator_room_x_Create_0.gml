depth = -10000
checked = 0
prop_cur = 0
prop_max = 32
message = ""
method = -1
image_speed = 0
prop_cur = round(real(obj_editor.properties_roomtarget_x))
message = string(prop_cur)
button[0] = instance_create(x, y, obj_editor_button0)
button[0].sprite_index = spr_editor_chooser_arrow_up
button[0].text = ""
button[0].host = id
button[0].key_target = 107
button[1] = instance_create((x + 8), (y + 8), obj_editor_button0)
button[1].sprite_index = spr_editor_chooser_arrow_up
button[1].image_yscale = -1
button[1].text = ""
button[1].host = id
button[1].key_target = 109
