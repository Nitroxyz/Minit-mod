y += (0.4 + front * 0.2)
x += (cos(angle) * (1 + front * 0.2) + (0.02 + front * 0.01) * obj_snow_generator.drift)
angle += angle_speed
image_angle += 0.1
if (y > 200)
    instance_destroy()
