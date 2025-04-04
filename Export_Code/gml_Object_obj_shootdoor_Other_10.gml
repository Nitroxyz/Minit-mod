switch state
{
    case 1:
        if (!instance_exists(bubble))
            state = 2
        break
    case 2:
        if (timer > 0)
            timer--
        else
        {
            state = 3
            timer = timer_max
        }
        break
    case 3:
        if (!(place_meeting(x, y, obj_player)))
        {
            bubble = instance_create((x - image_xscale * 3), y, obj_shootdoor_dummy)
            bubble.image_xscale = image_xscale
            bubble.image_yscale = image_yscale
            bubble.master = id
            bubble.state = "closing"
            bubble.iindex = bubble.image_number - 1
            state = 1
        }
        else
            state = 2
        break
    case 4:
        if instance_exists(bubble)
            bubble.state = "closing"
        else
        {
            bubble = instance_create((x - image_xscale * 3), y, obj_shootdoor_dummy)
            bubble.image_xscale = image_xscale
            bubble.image_yscale = image_yscale
            bubble.state = "closing"
            bubble.iindex = bubble.image_number - 1
        }
        state = 1
        break
}

animate_actor()
