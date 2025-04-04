draw_set_halign(fa_left)
if (dialogtemp != dialog)
{
    if (dialogfeedtimer == 0)
    {
        if (dialogchatcounter == 0)
        {
            if audio_is_playing(dialogsound)
                audio_stop_sound(dialogsound)
            switch voice
            {
                case "cat":
                    dialogsound = choose(233, 240, 239, 238, 237, 236, 235, 234)
                    break
                case "gary":
                    dialogsound = choose(248, 249, 250, 251, 252, 253, 254, 255, 256, 262, 257, 258, 259, 260, 261)
                    break
                case "sarge":
                    dialogsound = choose(113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123)
                    break
                default:
                    dialogsound = -1
                    break
            }

            if (dialogsound != -1)
            {
                var sc = audio_play_sound(dialogsound, 100, false)
                audio_sound_pitch(sc, random_range(0.9, 1.2))
            }
            dialogchatcounter = 2
        }
        else if (!audio_is_playing(dialogsound))
        {
            switch voice
            {
                case "cat":
                    dialogsound = choose(233, 240, 239, 238, 237, 236, 235, 234)
                    break
                case "gary":
                    dialogsound = choose(248, 249, 250, 251, 252, 253, 254, 255, 256, 262, 257, 258, 259, 260, 261)
                    break
                case "sarge":
                    dialogsound = choose(113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123)
                    break
                default:
                    dialogsound = -1
                    break
            }

            if (dialogsound != -1)
            {
                sc = audio_play_sound(dialogsound, 100, false)
                audio_sound_pitch(sc, random_range(0.9, 1.2))
            }
            dialogchatcounter = 2
        }
        else if (dialogsound != -1)
        {
            audio_sound_pitch(dialogsound, (audio_sound_get_pitch(dialogsound) + (choose(0.02, -0.02))))
            dialogchatcounter--
        }
        dialogfeedtimer = 2
        dialogtemp = string_copy(dialog, 0, (string_length(dialogtemp) + 1))
    }
    else
        dialogfeedtimer--
    scr_draw_dialog_pos(dialogtemp, dpos, 124)
}
else
    scr_draw_dialog_pos(dialog, dpos, 124)
