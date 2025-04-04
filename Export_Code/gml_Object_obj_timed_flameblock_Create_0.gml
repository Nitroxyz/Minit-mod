event_inherited()
image_speed = 0.25
sprite_index = spr_movingBack
flameobj = -1
if (instance_number(obj_timed_flameblock) == 1)
    makesound = 1
else
    makesound = 0
active = 0
flaming = 0
tick_timer = 180
tick_timer_max = tick_timer
tick_timer_mod_value = (tick_timer div 10) + 1
c_destroy = 0
hp = 5
dir = 180
hspd = 0
vspd = 0
spd = 2
target_spd = -0.75
accel = 0.025
iindex = 0
destroyontouch = 1
stuntimer = 2
