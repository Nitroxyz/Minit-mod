switch state
{
    case 1:
        if (cur_step < max_step)
        {
            if (timer > 0)
                timer--
            else
            {
                timer = timer_max
                var sfx = audio_play_sound(CatMeow, 5, false)
                audio_sound_pitch(sfx, sound[cur_step])
                var sfx2 = audio_play_sound(snd_intro_keyboard, 5, false)
                audio_sound_gain(sfx2, 0.5, 0)
                shake[cur_step] = 2
                cur_step++
            }
        }
        else
            state = 2
        break
}

shake[0] = approach(shake[0], 0, 0.1)
shake[1] = approach(shake[1], 0, 0.1)
shake[2] = approach(shake[2], 0, 0.1)
