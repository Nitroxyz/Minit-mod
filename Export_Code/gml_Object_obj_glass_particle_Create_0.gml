event_inherited()
var num = wrap((instance_number(obj_glass_particle) - 1), 0, 6)
iindex = num
image_angle = (floor(num / 4)) * 90
angle_raw = image_angle
hspd = ((iindex % 2) == 0 ? ((-iindex) / 4) : (iindex / 4))
vspd = -1 - (floor(iindex / 2))
grav = 0.13
timer = 190
