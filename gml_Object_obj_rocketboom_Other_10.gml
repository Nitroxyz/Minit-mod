alarm[0]--
if (alarm[0] == 0)
    atk = 0
if ((iindex + image_speed) >= (image_number - 1))
    instance_destroy()
else
    animate_actor()
