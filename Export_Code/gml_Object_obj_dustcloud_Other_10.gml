animate_actor()
x += ((hspd + sin(wobble)) / 6)
hspd = lerp(hspd, 0, 0.03)
y -= vspd
vspd += 0.015
wobble += 0.5
if (iindex >= 6.8)
    instance_destroy()
