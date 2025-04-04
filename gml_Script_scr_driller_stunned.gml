if (!(place_meeting(xtemp, (ytemp + 1), obj_wall)))
{
    grounded = 0
    vspd += 0.2
    image_index = 1
    image_speed = 0
}
else
{
    grounded = 1
    vspd = 0
}
if place_meeting(xtemp, (ytemp + vspd), obj_wall)
{
    while (!(place_meeting(xtemp, (ytemp + sign(vspd)), obj_wall)))
        ytemp += sign(vspd)
}
else
    ytemp += vspd
y = floor(ytemp)
