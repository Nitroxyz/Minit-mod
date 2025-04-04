hspd += ((0 - hspd) * h_decel)
vspd += (-v_decel)
x += hspd
y += vspd
animate_actor()
if (iindex > (image_number - 1))
    instance_destroy()
