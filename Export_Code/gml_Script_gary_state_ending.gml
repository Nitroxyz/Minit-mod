if (x < target_x)
    j_hor = 1
else
    j_hor = -1
if (!grounded)
{
    if place_meeting(x, (y + 1), obj_wall)
    {
        grounded = 1
        vspd = 0
    }
    else
    {
        vspd += grav
        if (vspd < -0.6)
            iindex = 0
        else if (vspd < 0.6)
            iindex = 1
        else
            iindex = 2
    }
}
else if (!(place_meeting(x, (y + 1), obj_wall)))
    grounded = 0
if grounded
{
    if (point_distance(x, y, target_x, y) < 6)
    {
        hspd = approach(hspd, 0, acc)
        if (hspd == 0)
        {
            image_xscale = -1
            state = 2
        }
    }
    else
    {
        hspd = approach(hspd, (j_hor * walk_spd), acc)
        image_xscale = sign(target_x - x)
        sprite_index = spr_gary_run
        image_speed = 0.2 * abs(hspd)
    }
}
gary_collisions()
animate_actor()
