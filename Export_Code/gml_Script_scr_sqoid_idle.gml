sprite_index = spr_sqoid
hspd += ((0 - hspd) * swim_drag)
vspd += ((0 - vspd) * swim_drag)
if (alarm[1] < 20)
    iindex = 0
if (alarm[1] > 0)
    alarm[1]--
else
{
    alarm[1] = swim_timer
    var pd = point_direction(0, 0, hspd, vspd)
    var ldx = lengthdir_x(swim_force, pd)
    var ldy = lengthdir_y(swim_force, pd)
    hspd = ldx
    vspd = ldy
    iindex = 1
}
image_angle = (point_direction(0, 0, hspd, vspd)) - 90
if place_meeting((x + hspd * 2), y, obj_wall)
{
    hdir *= -1
    hspd = (-hspd)
}
x += hspd
if place_meeting(x, (y + vspd * 2), obj_wall)
{
    vdir *= -1
    vspd = (-vspd)
}
y += vspd
