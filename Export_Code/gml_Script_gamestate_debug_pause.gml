get_input()
if j_start
    game_changestate_play()
var debug_button_step = keyboard_check_pressed(vk_f2)
if debug_button_step
    step_all_base()
