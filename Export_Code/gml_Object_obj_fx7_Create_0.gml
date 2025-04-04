var t = instance_create(obj_boss3.right_claw.x, obj_boss3.right_claw.y, obj_boss3_clawcharge)
t.par = obj_boss3.right_claw
t.xoff = 0
t.yoff = 0
t.image_angle = 180
t.image_speed = 0.5
t = instance_create(obj_boss3.left_claw.x, obj_boss3.left_claw.y, obj_boss3_clawcharge)
t.par = obj_boss3.left_claw
t.xoff = 0
t.yoff = 0
t.image_angle = 180
t.image_speed = 0.5
instance_destroy()
