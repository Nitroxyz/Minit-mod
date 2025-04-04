event_inherited()
sprite_index = spr_lab_tube
bottom = instance_create((x + 8), (y + 52), obj_wall)
bottom.image_xscale = 2
bottom.image_yscale = 0.375
bottom.visible = false
top = instance_create((x + 8), (y - 1.5), obj_wall)
top.image_xscale = 2
top.image_yscale = 0.8125
top.visible = false
bubble_timer = wrap((instance_number(obj_lab_tube) * 10), 10, 30)
bubble_timer_max = 30
