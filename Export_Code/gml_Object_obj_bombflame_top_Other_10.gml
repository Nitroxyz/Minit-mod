animate_actor()
if (iindex > 4)
    mask_index = spr_mask_none
if ((iindex + image_speed) >= image_number)
    instance_destroy()
if ((iindex % 1) > 0.5)
    visible = false
else
    visible = true
