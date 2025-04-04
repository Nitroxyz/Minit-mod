var flag0 = 0
var flag1 = 0
vspd = min((vspd + 0.1), 5)
y += vspd
iindex = floor(vspd)
while position_meeting(x, y, obj_wall)
{
    y--
    flag0 = 1
}
if position_meeting(x, y, obj_lavatop)
    flag0 = 1
if (y > (200 + ymax))
    flag1 = 1
if (flag0 || flag1)
{
    instance_destroy()
    if flag0
        instance_create(x, y, obj_drip_splash)
}
