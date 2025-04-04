x = 16 * (round((x - 8) / 16)) + 8
y = 16 * (round((y - 8) / 16)) + 8
while (!(place_meeting((x + sin(degtorad(image_angle))), (y + cos(degtorad(image_angle))), obj_wall)))
{
    x += sin(degtorad(image_angle))
    y += cos(degtorad(image_angle))
}
while place_meeting(x, y, obj_wall)
{
    x -= sin(degtorad(image_angle))
    y -= cos(degtorad(image_angle))
}
hspd = cos(degtorad(image_angle))
vspd = sin(degtorad(image_angle))
