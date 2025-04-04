if gamepad_is_connected(global.controller_slot)
    global.controller_type = 0
else
    global.controller_type = 4
process_define_button_names()
