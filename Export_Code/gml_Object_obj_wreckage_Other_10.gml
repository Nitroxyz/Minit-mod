switch state
{
    case 0:
        if (y < ytar)
        {
            ytemp -= 0.1
            ytemp += momentum
            momentum -= (0.01 * sign(momentum))
            y = round(ytemp)
        }
        else
            y = ystart
        if place_meeting(x, y, obj_wreckage_rubble)
        {
            var t = instance_place(x, y, obj_wreckage_rubble)
            if (t != noone)
            {
                with (t)
                    instance_destroy()
            }
        }
        break
    case 1:
        if place_meeting(x, y, obj_player)
        {
            with (obj_player)
            {
                x = other.playertarget_x
                y = -2
            }
        }
        break
    case 2:
        if instance_exists(obj_player)
        {
            if obj_player.grounded
                state = 1
        }
        break
}

