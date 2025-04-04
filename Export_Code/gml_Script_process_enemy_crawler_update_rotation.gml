if (image_angle < 0)
    image_angle += 360
else if (image_angle >= 360)
    image_angle -= 360
switch image_angle
{
    case 0:
        hspd = dir
        vspd = 0
        break
    case 90:
        hspd = 0
        vspd = (-dir)
        break
    case 180:
        hspd = (-dir)
        vspd = 0
        break
    case 270:
        hspd = 0
        vspd = dir
        break
}

