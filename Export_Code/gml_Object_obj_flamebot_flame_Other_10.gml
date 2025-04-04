hspd = lengthdir_x(spd, movedir)
vspd = lengthdir_y(spd, movedir)
x += hspd
y += vspd
animate_actor()
if (iindex > 6)
    mask_index = spr_mask_none
if ((iindex + image_speed) >= image_number)
    instance_destroy()
