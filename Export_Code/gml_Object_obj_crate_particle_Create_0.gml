event_inherited()
depth = 6
var num = wrap((instance_number(obj_crate_particle) - 1), 0, 4)
iindex = num
image_angle = (floor(num / 4)) * 90
angle_raw = image_angle
hspd = ((iindex % 2) == 0 ? ((-iindex) / 6) : (iindex / 6)) + (random_range(-1, 1))
vspd = (random_range(-2, -1)) - floor(iindex)
grav = 0.17
timer = 190
