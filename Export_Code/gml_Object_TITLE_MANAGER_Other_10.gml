menu_text = [loc_read_line(552), loc_read_line(553), loc_read_line(554)]
menu_functions = [633, 646, 634]
for (var i = 0; i < 3; i++)
{
    if save_choice[i]
        fselect_text[i] = loc_read_line(555) + " " + (string(i + 1)) + ": " + name[i] + "%"
    else
        fselect_text[i] = loc_read_line(555) + " " + (string(i + 1))
}
fselect_text[3] = loc_read_line(549)
