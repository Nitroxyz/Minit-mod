switch global.language
{
    case 1:
        global.text_x_offset = 0
        global.text_offset = -1
        global.ui_text_offset = 0
        global.hud_text_offset = 3
        global.text_v_spacing = -4
        break
    case 2:
        global.text_x_offset = 0
        global.text_offset = -1
        global.ui_text_offset = 0
        global.hud_text_offset = 3
        global.text_v_spacing = -4
        break
    case 3:
        global.text_x_offset = 0
        global.text_offset = -1
        global.ui_text_offset = 0
        global.hud_text_offset = 3
        global.text_v_spacing = -4
        break
    case 4:
        global.text_x_offset = 0
        global.text_offset = -1
        global.ui_text_offset = 0
        global.hud_text_offset = 3
        global.text_v_spacing = -4
        break
    case 5:
        global.text_x_offset = 0
        global.text_offset = -1
        global.ui_text_offset = 0
        global.hud_text_offset = 3
        global.text_v_spacing = -4
        break
    case 6:
        global.text_x_offset = 0
        global.text_offset = 1
        global.ui_text_offset = 2
        global.hud_text_offset = 5
        global.text_v_spacing = -2
        break
    case 9:
        global.text_x_offset = 0
        global.text_offset = 2
        global.ui_text_offset = 0
        global.hud_text_offset = 3
        global.text_v_spacing = 0
        break
    case 10:
        global.text_x_offset = 0
        global.text_offset = 2
        global.ui_text_offset = 0
        global.hud_text_offset = 3
        global.text_v_spacing = 0
        break
    case 8:
        global.text_x_offset = 2
        global.text_offset = 2
        global.ui_text_offset = 0
        global.hud_text_offset = 3
        global.text_v_spacing = 0
        break
    case 7:
        global.text_x_offset = 2
        global.text_offset = 3
        global.ui_text_offset = 2
        global.hud_text_offset = 5
        global.text_v_spacing = 1
        break
    default:
        global.text_x_offset = 0
        global.text_offset = 0
        global.ui_text_offset = 0
        global.hud_text_offset = 0
        global.text_v_spacing = -5
        break
}

draw_set_font(global.font[global.language])
