animate_actor()
sprite_index = spr_sqoid
movespeed = lerp(movespeed, 0.2, 0.05)
if (!stun)
{
    hspd = hdir * movespeed
    vspd = vdir * movespeed
}
else
{
    hspd = 0
    vspd = 0
}
if place_meeting((x + hspd * 2), y, obj_wall)
{
    hdir *= -1
    alarm[1] += 10
}
x += hspd
if place_meeting(x, (y + vspd * 2), obj_wall)
{
    vdir *= -1
    alarm[1] += 10
}
y += vspd
