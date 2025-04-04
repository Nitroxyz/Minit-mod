switch state
{
    case 1:
        if (vspd > 1 && place_meeting(x, (y + 1), obj_wall))
            state = 0
        else
        {
            vspd = min((vspd + 0.2), 8)
            if ((!(place_meeting(x, (y + vspd), obj_wall))) && (!(place_meeting(x, (y + vspd), obj_player))))
                y += vspd
            else
            {
                while ((!(place_meeting(x, (y + vspd), obj_wall))) && (!(place_meeting(x, (y + vspd), obj_player))))
                    y += sign(vspd)
            }
        }
        break
}

