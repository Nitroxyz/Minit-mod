anim_timer--
if (anim_timer <= 0)
{
    anim_timer = anim_timer_max
    blink = (!blink)
}
if (global.lab_unlocked == 0 && dialog_event_triggered == 0)
{
    if instance_exists(obj_info_console_button)
    {
        if obj_info_console_button.pressed
        {
            dialog_event_triggered = 1
            qu_set(dialog_event)
        }
    }
}
