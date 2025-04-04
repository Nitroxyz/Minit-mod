switch state_step
{
    case 0:
        if instance_exists(obj_barkley_ai)
        {
            with (obj_barkley_ai)
            {
                state = 9
                image_xscale = -1
            }
            qu_wait(1)
        }
        break
}

