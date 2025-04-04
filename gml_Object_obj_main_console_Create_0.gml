event_inherited()
sprite_index = spr_main_console
mask_index = spr_main_console
depth = 2
anim_timer = 15
anim_timer_max = anim_timer
blink = 1
var clearflag = 1
if (global.water_level < 3)
{
    clearflag = 0
    icon[0] = 2
}
else
    icon[0] = 4
if global.lava_cooled
    icon[1] = 4
else
{
    clearflag = 0
    icon[1] = 2
}
if (global.vents_cleared > 2)
    icon[2] = 4
else
{
    clearflag = 0
    icon[2] = 2
}
dialog_event = (global.bigpc_discovered == 0 ? 206 : 207)
dialog_event_triggered = 0
if clearflag
{
    if global.decoder_complete
        dialog_event = 204
    else
        dialog_event = 205
}
