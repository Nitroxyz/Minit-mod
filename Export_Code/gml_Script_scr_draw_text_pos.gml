draw_set_font(global.font[global.language])
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
            h += (string_height(temp) + global.text_v_spacing)
            j = 0
        }
        else
        {
            draw_text((argument1 + j + obj_shake.alarm[0] * (random_range(-0.135, 0.135))), (argument2 + h + obj_shake.alarm[0] * (random_range(-0.135, 0.135))), temp)
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
            h += (string_height(temp) + global.text_v_spacing)
            j = 0
        }
        else
        {
            draw_text((argument1 + j), (argument2 + h), temp)
            j += string_width(temp)
        }
    }
}
