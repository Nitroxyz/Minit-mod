alarm[0] = 120
ang = random(360)
wide = 72
intro = 0
widescreen = 0
alarm[1] = 1
ready = 0
blink = 1
type = 0
item = 1
global.view_5 = __view_get(0, 0)
global.view_6 = __view_get(1, 0)
surface_set_target(global.playersurf)
draw_clear_alpha(c_black, 0)
surface_reset_target()
alarm0_pause = alarm[0]
alarm1_pause = alarm[1]
paused = 0
