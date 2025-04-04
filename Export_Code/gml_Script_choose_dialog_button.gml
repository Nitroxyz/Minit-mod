dialog_controller_sprite = 672
switch global.controller_type
{
    case 0:
        switch argument0
        {
            case "A":
                dialog_controller_frame = 0
                dialog_variable = "A"
                break
            case "B":
                dialog_controller_frame = 0
                dialog_variable = "B"
                break
            case "X":
                dialog_controller_frame = 0
                dialog_variable = "X"
                break
            case "Y":
                dialog_controller_frame = 0
                dialog_variable = "Y"
                break
            case "R":
                dialog_controller_frame = 1
                dialog_variable = "R"
                break
        }

        break
    case 4:
        switch argument0
        {
            case "A":
                var tkey = global.keybinding_jump_key
                dialog_controller_frame = keybinding_find_key_icon(tkey) + 2
                dialog_variable = keybinding_find_key_name(tkey)
                break
            case "B":
                tkey = global.keybinding_rocket_key
                dialog_controller_frame = keybinding_find_key_icon(tkey) + 2
                dialog_variable = keybinding_find_key_name(tkey)
                break
            case "X":
                tkey = global.keybinding_shoot_key
                dialog_controller_frame = keybinding_find_key_icon(tkey) + 2
                dialog_variable = keybinding_find_key_name(tkey)
                break
            case "Y":
                tkey = global.keybinding_eject_key
                dialog_controller_frame = keybinding_find_key_icon(tkey) + 2
                dialog_variable = keybinding_find_key_name(tkey)
                break
            case "R":
                tkey = global.keybinding_dash_key
                dialog_controller_frame = keybinding_find_key_icon(tkey) + 2
                dialog_variable = keybinding_find_key_name(tkey)
                break
        }

        break
    case 2:
        switch argument0
        {
            case "A":
                dialog_controller_frame = 5
                dialog_variable = " "
                break
            case "B":
                dialog_controller_frame = 6
                dialog_variable = " "
                break
            case "X":
                dialog_controller_frame = 7
                dialog_variable = " "
                break
            case "Y":
                dialog_controller_frame = 8
                dialog_variable = " "
                break
            case "R":
                dialog_controller_frame = 9
                dialog_variable = "R"
                break
        }

        break
    case 1:
        switch argument0
        {
            case "A":
                dialog_controller_frame = 0
                dialog_variable = "B"
                break
            case "B":
                dialog_controller_frame = 0
                dialog_variable = "A"
                break
            case "X":
                dialog_controller_frame = 0
                dialog_variable = "Y"
                break
            case "Y":
                dialog_controller_frame = 0
                dialog_variable = "X"
                break
            case "R":
                dialog_controller_frame = 1
                dialog_variable = "R"
                break
        }

        break
}

