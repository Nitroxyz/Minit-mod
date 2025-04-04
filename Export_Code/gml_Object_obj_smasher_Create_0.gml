event_inherited()
active = 0
activation_timer = wrap((90 + 30 * instance_number(obj_smasher)), 30, 120)
activation_timer_max = 120
cooldown_timer = 120
cooldown_timer_max = 120
detach_timer = 30
detach_timer_max = detach_timer
ytether = y
dir = 1
vspd = 0
vspd_max = 10
depth = 6
collider_active = 0
collider = instance_create(x, y, obj_smasher_collider)
instance_deactivate_object(collider)
blocker = instance_create((x + 8), (y - 16), obj_wall)
blocker.ytether = blocker.y
blocker.visible = false
