j_right = (keyboard_check(vk_right) || keyboard_check(global.keybinding_right_key) || gamepad_axis_value(global.controller_slot, gp_axislh) > 0.3 || gamepad_button_check(global.controller_slot, gp_padr))
j_left = (keyboard_check(vk_left) || keyboard_check(global.keybinding_left_key) || gamepad_axis_value(global.controller_slot, gp_axislh) < -0.3 || gamepad_button_check(global.controller_slot, gp_padl))
j_up = (keyboard_check(vk_up) || keyboard_check(global.keybinding_up_key) || gamepad_axis_value(global.controller_slot, gp_axislv) < -0.3 || gamepad_button_check(global.controller_slot, gp_padu))
j_down = (keyboard_check(vk_down) || keyboard_check(global.keybinding_down_key) || gamepad_axis_value(global.controller_slot, gp_axislv) > 0.3 || gamepad_button_check(global.controller_slot, gp_padd))
j_right_pressed = (keyboard_check_pressed(vk_right) || keyboard_check_pressed(global.keybinding_right_key) || gamepad_button_check_pressed(global.controller_slot, gp_padr))
j_left_pressed = (keyboard_check_pressed(vk_left) || keyboard_check_pressed(global.keybinding_left_key) || gamepad_button_check_pressed(global.controller_slot, gp_padl))
j_up_pressed = (keyboard_check_pressed(vk_up) || keyboard_check_pressed(global.keybinding_up_key) || gamepad_button_check_pressed(global.controller_slot, gp_padu))
j_down_pressed = (keyboard_check_pressed(vk_down) || keyboard_check_pressed(global.keybinding_down_key) || gamepad_button_check_pressed(global.controller_slot, gp_padd))
j_a = (keyboard_check(global.keybinding_jump_key) || gamepad_button_check(global.controller_slot, gp_face1))
j_x = (keyboard_check(global.keybinding_shoot_key) || gamepad_button_check(global.controller_slot, gp_face3))
j_b = (keyboard_check(global.keybinding_rocket_key) || gamepad_button_check(global.controller_slot, gp_face2))
j_y = (keyboard_check(global.keybinding_eject_key) || gamepad_button_check(global.controller_slot, gp_face4))
j_a_pressed = (keyboard_check_pressed(global.keybinding_jump_key) || gamepad_button_check_pressed(global.controller_slot, gp_face1))
j_x_pressed = (keyboard_check_pressed(global.keybinding_shoot_key) || gamepad_button_check_pressed(global.controller_slot, gp_face3))
j_b_pressed = (keyboard_check_pressed(global.keybinding_rocket_key) || gamepad_button_check_pressed(global.controller_slot, gp_face2))
j_y_pressed = (keyboard_check_pressed(global.keybinding_eject_key) || gamepad_button_check_pressed(global.controller_slot, gp_face4))
j_a_up = (keyboard_check_released(global.keybinding_jump_key) || gamepad_button_check_released(global.controller_slot, gp_face1))
j_x_up = (keyboard_check_released(global.keybinding_shoot_key) || gamepad_button_check_released(global.controller_slot, gp_face3))
j_b_up = (keyboard_check_released(global.keybinding_rocket_key) || gamepad_button_check_released(global.controller_slot, gp_face2))
j_y_up = (keyboard_check_released(global.keybinding_eject_key) || gamepad_button_check_released(global.controller_slot, gp_face4))
j_start = (keyboard_check_pressed(vk_return) || gamepad_button_check_pressed(global.controller_slot, gp_start))
j_select = (keyboard_check_pressed(global.keybinding_dash_key) || gamepad_button_check_pressed(global.controller_slot, gp_select))
j_debug = ((gamepad_button_check(global.controller_slot, gp_face4) && gamepad_button_check(global.controller_slot, gp_select)) || keyboard_check(vk_down))
j_skip = (j_a && j_y)
if (global.minit_mode > 0 && keyboard_check_pressed(ord("R")))
    global.minit_reset = 1
var totalButtons = j_a + j_b + j_x + j_y + j_left + j_right + j_up + j_down + j_start
return totalButtons;
