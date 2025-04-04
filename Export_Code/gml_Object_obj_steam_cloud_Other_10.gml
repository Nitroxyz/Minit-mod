if ((iindex + image_speed) < 8)
    animate_actor()
else
    instance_destroy()
x = xcenter + sinemag * sin(angle)
xcenter += hspd
y += vspd
vspd -= lift
angle += angle_speed
angle_speed -= angle_speed_decay
hspd = approach(hspd, 0, hspd_decay)
sinemag = approach(sinemag, 0, sinemag_decay)
