animate_actor()
if (out_of_water || iindex == 0)
    instance_destroy()
mass = massinit - iindex / 2
hspd += ((0 - hspd) * h_decel)
if place_meeting(x, y, obj_lavatop)
    vspd += (-v_decel)
else
    vspd = 0
v_decel = v_decelo + iindex / 100
x = clamp((x + hspd), xmin, xmax)
y += vspd
x += ((random_range(-2, 2)) / mass)
if (!(place_meeting(x, (y + 1), obj_lavatop)))
    instance_destroy()
