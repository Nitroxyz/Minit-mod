if cannot_escape
{
    scr_cout("welcome back master.")
    cannot_escape = 0
}
else
{
    alarm[0] = 30
    editor_save_room(global.current_room)
    scr_cout("goodbye master.")
}
