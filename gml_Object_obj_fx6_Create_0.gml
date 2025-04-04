var t = instance_create(obj_boss3.right_claw.x, (obj_boss3.right_claw.y - 10), obj_grenade_grenadier)
t.hspd *= ((sign(obj_boss3.xstart - obj_boss3.x)) * 1.15)
t.alarm[0] *= 2.5
instance_destroy()
