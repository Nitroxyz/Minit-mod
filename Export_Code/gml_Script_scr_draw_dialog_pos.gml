draw_set_font(global.font[global.language])
switch dialog_style
{
    case "wavy":
        dialog_style_wavy_angle += dialog_style_wavy_speed
        break
}

var text = string(argument0)
var j = 0
var h = 0
var fr = -1
if instance_exists(obj_shake)
{
    for (var i = 1; i <= string_length(text); i++)
    {
        var temp = string_char_at(text, i)
        if (temp == "#")
        {
            h += (string_height(temp) + global.text_v_spacing + button_icon_offset)
            j = 0
        }
        else if (temp == "[")
        {
            if (obj_controller.dialog_controller_sprite != -1)
            {
                draw_sprite(obj_controller.dialog_controller_sprite, obj_controller.dialog_controller_frame, (argument1 + j + obj_shake.alarm[0] * (random_range(-0.135, 0.135))), (argument2 + obj_shake.alarm[0] * (random_range(-0.135, 0.135)) + h - global.ui_text_offset))
                draw_set_color(c_black)
                draw_set_font(fnt_nesultra)
                draw_text((argument1 + j + obj_shake.alarm[0] * (random_range(-0.135, 0.135))), (argument2 + obj_shake.alarm[0] * (random_range(-0.135, 0.135)) + h - global.ui_text_offset), obj_controller.dialog_variable)
                draw_set_color(c_white)
                j += (string_width(obj_controller.dialog_variable) + 2)
                draw_set_font(global.font[global.language])
            }
            else
            {
                draw_text((argument1 + j + obj_shake.alarm[0] * (random_range(-0.135, 0.135))), (argument2 + obj_shake.alarm[0] * (random_range(-0.135, 0.135)) + h), obj_controller.dialog_variable)
                j += string_width(obj_controller.dialog_variable)
            }
        }
        else
        {
            switch dialog_style
            {
                case "wavy":
                    draw_text((argument1 + j + obj_shake.alarm[0] * (random_range(-0.135, 0.135))), (argument2 + obj_shake.alarm[0] * (random_range(-0.135, 0.135)) + h + (sin(dialog_style_wavy_angle + j * dialog_style_wavy_spread / 4)) * dialog_style_wavy_mag), temp)
                    break
                case "nervous":
                    draw_text((argument1 + j + obj_shake.alarm[0] * (random_range(-0.135, 0.135))), (argument2 + (random_range(-0.8, 0.8)) + h + obj_shake.alarm[0] * (random_range(-0.135, 0.135))), temp)
                    break
                case "normal":
                    draw_text((argument1 + j + obj_shake.alarm[0] * (random_range(-0.135, 0.135))), (argument2 + h + obj_shake.alarm[0] * (random_range(-0.135, 0.135))), temp)
                    break
            }

            j += string_width(temp)
        }
    }
}
else
{
    for (i = 1; i <= string_length(text); i++)
    {
        temp = string_char_at(text, i)
        if (temp == "#")
        {
            h += (string_height(temp) + global.text_v_spacing + button_icon_offset)
            j = 0
        }
        else if (temp == "@")
        {
            draw_text((argument1 + j), (argument2 + h), "#")
            j += string_width("#")
        }
        else if (temp == "[")
        {
            if (obj_controller.dialog_controller_sprite != -1)
            {
                draw_sprite(obj_controller.dialog_controller_sprite, obj_controller.dialog_controller_frame, (argument1 + j), (argument2 + h - global.ui_text_offset))
                draw_set_color(c_black)
                draw_set_font(fnt_nesultra)
                draw_text((argument1 + j), (argument2 + h - global.ui_text_offset), obj_controller.dialog_variable)
                draw_set_color(c_white)
                j += (string_width(obj_controller.dialog_variable) + 2)
                draw_set_font(global.font[global.language])
            }
            else
            {
                draw_text((argument1 + j), (argument2 + h), obj_controller.dialog_variable)
                j += string_width(obj_controller.dialog_variable)
            }
        }
        else
        {
            switch dialog_style
            {
                case "wavy":
                    draw_text((argument1 + j), (argument2 + h + (sin(dialog_style_wavy_angle + j * dialog_style_wavy_spread / 4)) * dialog_style_wavy_mag), temp)
                    break
                case "nervous":
                    draw_text((argument1 + j), (argument2 + (random_range(-0.8, 0.8)) + h), temp)
                    break
                case "normal":
                    draw_text((argument1 + j), (argument2 + h), temp)
                    break
            }

            j += string_width(temp)
        }
    }
}
