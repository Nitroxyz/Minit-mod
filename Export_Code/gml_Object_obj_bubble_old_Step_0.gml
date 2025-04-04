x += (sin(wobble) * hspd / 2)
hspd = lerp(hspd, 0, 0.03)
y -= vspd
vspd += 0.0125
size -= 0.05
image_index = min((image_index + 0.1), 6)
if (image_index >= 6)
    instance_destroy()
