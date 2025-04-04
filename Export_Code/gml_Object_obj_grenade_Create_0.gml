event_inherited()
enemy_null()
stun_state = 317
bouncespeed = 2.3
vspd = -2.5
hspd = 0.8
xtemp = x
ytemp = y
image_speed = 0.1
alarm[0] = 90
destroyontouch = 1
water = 0
makesound = 0
spinhurt = 1
if (place_meeting(x, y, obj_wall) || place_meeting(x, y, obj_bridgenode))
{
    var offset = 1
    var dir = 0
    var xoff = 1
    var yoff = 0
    while (place_meeting((x + xoff), (y + yoff), obj_wall) || place_meeting((x + xoff), (y + yoff), obj_bridgenode))
    {
        dir += 90
        if (dir >= 360)
        {
            dir = 0
            offset++
        }
        xoff = cos(degtorad(dir)) * offset
        yoff = sin(degtorad(dir)) * offset
    }
    x += xoff
    y += yoff
    xtemp = x
    ytemp = y
}
iindex = 0
