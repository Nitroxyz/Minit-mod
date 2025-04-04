global.controller_sprite = 672
var btns = ["A", "B", "X", "Y", "R"]
for (var i = 0; i < array_length_1d(btns); i++)
{
    switch global.controller_type
    {
        case 0:
            switch btns[i]
            {
                case "A":
                    global.controller_a_frame = 0
                    global.controller_a_name = "A"
                    break
                case "B":
                    global.controller_b_frame = 0
                    global.controller_b_name = "B"
                    break
                case "X":
                    global.controller_x_frame = 0
                    global.controller_x_name = "X"
                    break
                case "Y":
                    global.controller_y_frame = 0
                    global.controller_y_name = "Y"
                    break
                case "R":
                    global.controller_r_frame = 3
                    global.controller_r_name = "R"
                    break
            }

            break
        case 4:
            switch btns[i]
            {
                case "A":
                    var tkey = global.keybinding_jump_key
                    global.controller_a_frame = keybinding_find_key_icon_hud(tkey)
                    global.controller_a_name = keybinding_find_key_name_hud(tkey)
                    break
                case "B":
                    tkey = global.keybinding_rocket_key
                    global.controller_b_frame = keybinding_find_key_icon_hud(tkey)
                    global.controller_b_name = keybinding_find_key_name_hud(tkey)
                    break
                case "X":
                    tkey = global.keybinding_shoot_key
                    global.controller_x_frame = keybinding_find_key_icon_hud(tkey)
                    global.controller_x_name = keybinding_find_key_name_hud(tkey)
                    break
                case "Y":
                    tkey = global.keybinding_eject_key
                    global.controller_y_frame = keybinding_find_key_icon_hud(tkey)
                    global.controller_y_name = keybinding_find_key_name_hud(tkey)
                    break
                case "R":
                    tkey = global.keybinding_dash_key
                    global.controller_r_frame = keybinding_find_key_icon_hud(tkey)
                    global.controller_r_name = keybinding_find_key_name_hud(tkey)
                    break
            }

            break
        case 2:
            switch btns[i]
            {
                case "A":
                    global.controller_a_frame = 0
                    global.controller_a_name = " "
                    break
                case "B":
                    global.controller_b_frame = 0
                    global.controller_b_name = " "
                    break
                case "X":
                    global.controller_x_frame = 0
                    global.controller_x_name = " "
                    break
                case "Y":
                    global.controller_y_frame = 0
                    global.controller_y_name = " "
                    break
                case "R":
                    global.controller_r_frame = 0
                    global.controller_r_name = "R"
                    break
            }

            break
        case 1:
            switch btns[i]
            {
                case "A":
                    global.controller_a_frame = 0
                    global.controller_a_name = "B"
                    break
                case "B":
                    global.controller_b_frame = 0
                    global.controller_b_name = "A"
                    break
                case "X":
                    global.controller_x_frame = 0
                    global.controller_x_name = "Y"
                    break
                case "Y":
                    global.controller_y_frame = 0
                    global.controller_y_name = "X"
                    break
                case "R":
                    global.controller_r_frame = 3
                    global.controller_r_name = "R"
                    break
            }

            break
    }

}
