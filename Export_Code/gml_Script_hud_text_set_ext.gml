with (obj_hud)
{
    button_icon_offset = 0
    dialog_style = "normal"
    dialogfeedtimer = 4
    dialogtemp = ""
    dialog_mode = 1
    dialog_portrait = argument1
    dialog_portrait_index = argument2
    dialog_style = argument3
    dialog_off = 0
    dialog_box_height = 42
    draw_set_font(global.font[global.language])
    if (argument0 == 0)
        var targetstring = ""
    else
    {
        targetstring = loc_read_line(argument0)
        var i = 0
        while (i < string_length(targetstring))
        {
            if (string_char_at(targetstring, (i + 1)) == "[")
            {
                var bracketcur = i + 1
                var targetstring_mod = ""
                while (string_char_at(targetstring, bracketcur) != "]")
                    bracketcur++
                var chrins = "["
                if (obj_controller.dialog_controller_sprite != -1)
                {
                    if (global.language != 9 && global.language != 10 && global.language != 8 && global.language != 7)
                        button_icon_offset = 2
                    chrins = " [ "
                }
                else
                    chrins = obj_controller.dialog_variable
                targetstring_mod = (string_copy(targetstring, 1, i)) + chrins + (string_copy(targetstring, (bracketcur + 1), (string_length(targetstring) - bracketcur)))
                targetstring = targetstring_mod
                break
            }
            else
            {
                i++
                continue
            }
        }
    }
    var linecount = 1
    var newstring = ""
    var linestring = ""
    var linecalc_offset = 0
    while (string_length(newstring) < (string_length(targetstring) + linecalc_offset))
    {
        if (string_char_at(targetstring, (string_length(newstring) + 1 - linecalc_offset)) == " ")
        {
            var t_linestring = linestring
            var currentpos = string_length(newstring) + 1 - linecalc_offset
            while (currentpos <= string_length(targetstring))
            {
                t_linestring += string_char_at(targetstring, currentpos)
                currentpos++
                if (string_char_at(targetstring, currentpos) == " ")
                    break
                else
                    continue
            }
            if (string_width(t_linestring) > 210)
            {
                newstring = newstring + "#"
                linestring = ""
                linecount++
            }
            else
            {
                newstring = newstring + (string_char_at(targetstring, (string_length(newstring) + 1 - linecalc_offset)))
                linestring = linestring + (string_char_at(targetstring, (string_length(newstring) + 1 - linecalc_offset)))
            }
        }
        else if (string_width(linestring) > 210)
        {
            newstring = newstring + "#"
            linestring = ""
            linecalc_offset++
            linecount++
        }
        else
        {
            newstring = newstring + (string_char_at(targetstring, (string_length(newstring) + 1 - linecalc_offset)))
            linestring = linestring + (string_char_at(targetstring, (string_length(newstring) + 1 - linecalc_offset)))
        }
    }
    dialog = newstring
    if (linecount > 3)
        dialog_box_height = 54
}
