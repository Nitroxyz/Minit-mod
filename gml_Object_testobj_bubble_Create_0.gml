depth = 0
if (!(place_meeting(x, y, obj_lavatop)))
    instance_destroy()
hspd = random_range(-1, 1)
vspd = 0
h_decel = 0.1
v_decel = 0.025
v_decelo = v_decel
image_speed = choose(0.05, 0.1, 0.2, 0.25)
mass = 3
massinit = mass
iindex = 0
