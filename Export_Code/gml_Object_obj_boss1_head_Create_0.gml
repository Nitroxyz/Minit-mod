event_inherited()
hp = 120
hpold = hp
hp_max = hp
image_speed = 0
image_index = 0
ant = instance_create((x + 3), (y - 22), obj_boss1_ant)
ant.visible = false
state = 2
init_state = 2
pause_state = 2
dontdestroy = 1
hitsound = 246
stuntimer = 10
donotdestroy = 1
global.boss_hud_active = 1
global.boss_hud_target = id
