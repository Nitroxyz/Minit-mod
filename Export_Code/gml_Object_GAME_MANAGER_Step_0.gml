if t_visible
    script_execute(state)
var buttons = get_input()
if buttons
    timesincelastinput = 0
if (second_timer > 0)
    second_timer--
else
{
    second_timer = 60
    global.playtime++
    if (!buttons)
        timesincelastinput++
}
if (global.minit_reset == 1)
{
    minit_reset_timer--
    if (minit_reset_timer == 0)
    {
        minit_reset_timer = 1
        global.minit_time--
    }
}
if j_debug
{
    if (debug_reset_timer < 180)
        debug_reset_timer++
    else
        event_perform(ev_keyrelease, vk_escape)
}
else
    debug_reset_timer = 0
