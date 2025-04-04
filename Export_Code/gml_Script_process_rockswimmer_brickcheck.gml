touching_rock_old = touching_rock
var t_rock = instance_position((x + hspd), (y + vspd), obj_wall)
if (t_rock != noone)
{
    if (!(position_meeting((x + hspd), (y + vspd), obj_wall2)))
    {
        if (x < t_rock.bbox_right && x > t_rock.bbox_left)
            vspd *= -0.7
        else if (y < t_rock.bbox_bottom && y > t_rock.bbox_top)
            hspd *= -0.7
        touching_rock = 0
    }
    else
    {
        touching_rock = 1
        with (t_rock)
            shake = 20
    }
}
else
    touching_rock = 0
