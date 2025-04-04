switch state
{
    case 0:
        if (dialogposition > 0)
            dialogv -= (0.2 * sign(dialogv))
        else
            dialogv += 0.2
        dialogposition += dialogv
        dialogposition = lerp(dialogposition, 37, 0.25)
        image_speed -= 0.005
        if (dialogv == 0)
        {
            dialogposition = 37
            state = 1
            image_speed = 0
            image_index = 0
            dialogv = -2
        }
        break
    case 2:
        dialogv -= 0.4
        dialogposition += dialogv
        dialogposition = lerp(dialogposition, -120, 0.05)
        if (dialogposition < -118)
            instance_destroy()
        break
}

