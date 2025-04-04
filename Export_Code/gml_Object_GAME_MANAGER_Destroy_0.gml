if instance_exists(ui)
{
    with (ui)
        instance_destroy()
}
if instance_exists(mm)
{
    with (mm)
        instance_destroy()
}
if (room == r_play || room == r_editor_testroom)
{
    if global.editor
        room_goto(r_editor)
    else
        room_goto(r_title)
    application_surface_draw_enable(true)
}
