if grounded
{
    if (!(place_meeting(x, (y + 1), obj_wall)))
    {
        grounded = 0
        vspd = -1
    }
}
else
{
    vspd += grav
    if (!(place_meeting(x, (y + vspd), obj_wall)))
        y += vspd
    else
    {
        while (!(place_meeting(x, (y + sign(vspd)), obj_wall)))
            y += sign(vspd)
        vspd *= -0.8
        instance_create(x, (y + 8), obj_dust_cloud_land)
        if (vspd < 0 && vspd > -1)
        {
            vspd = 0
            grounded = 1
        }
    }
}
