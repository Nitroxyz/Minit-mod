with (obj_cutscene_dialog)
{
    dialogfeedtimer = 4
    dialogtemp = ""
    dialog = argument0
    dialog_style = argument1
    if (dialog != "")
    {
        var charpos = 1
        var strlen = string_length(dialog)
        while (string_char_at(dialog, charpos) != "#" && charpos < strlen)
            charpos++
        charpos--
        dpos = 135
    }
    else
        dpos = 135
}
