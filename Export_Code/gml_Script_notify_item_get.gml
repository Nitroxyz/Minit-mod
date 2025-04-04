var t = instance_create(0, 0, obj_item_notification)
t.sprite_index = argument0
t.itemname = argument1
draw_set_font(global.font[global.language])
if (t.itemname == 0)
    var targetstring = ""
else
    targetstring = loc_read_line(t.itemname)
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
    }
    else
    {
        newstring = newstring + (string_char_at(targetstring, (string_length(newstring) + 1 - linecalc_offset)))
        linestring = linestring + (string_char_at(targetstring, (string_length(newstring) + 1 - linecalc_offset)))
    }
}
t.itemname = newstring
