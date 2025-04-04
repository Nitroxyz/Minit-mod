switch state
{
    case 0:
        if (iindex == (image_number - 1))
        {
            state = 1
            audio_play_sound(snd_rebbamod, 100, false)
        }
        else
            animate_actor()
        break
    case 2:
        image_speed = -1
        state = 3
        break
    case 3:
        if (iindex == 0)
            instance_destroy()
        else
            animate_actor()
        break
}

