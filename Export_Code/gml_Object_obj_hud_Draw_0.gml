if ((!view_enabled[1]) || (!surface_exists(global.hudsurf)) || instance_exists(PAUSE_MENU))
    return;
surface_set_target(global.hudsurf)
draw_clear_alpha(c_black, 0)
draw_set_halign(fa_left)
var tvx = -3
var tvy = 0
if (!dialog_mode)
{
    if ((!instance_exists(obj_player)) && (!instance_exists(obj_screen_freeze)))
    {
        if ((!instance_exists(obj_particle1)) && (!instance_exists(obj_rocketboom)))
        {
            if (!instance_exists(obj_respawn_fade))
                instance_create(0, 0, obj_respawn_fade)
            surface_reset_target()
            return;
        }
    }
}
else
{
    if (!dialog_off)
    {
        if (dialogsnapped == 0)
        {
            var snapflag = 1
            dialogposition = lerp(dialogposition, 37, 0.085)
            if (abs(37 - dialogposition) < 0.5)
                dialogposition = 37
            else
            {
                dialogposition += (0.5 * (sign(14 - dialogposition)))
                snapflag = 0
            }
            if snapflag
                dialogsnapped = 1
        }
    }
    if (!dialog_off)
    {
        draw_frame3((tvx + 2 + dialogposition - 13), (tvy + 24), (tvx + 2 + dialogposition + 257), (tvy + 24 + dialog_box_height))
        draw_frame4((tvx + 2 + dialogposition - 5), (tvy + 32), (tvx + 2 + dialogposition + 21), (tvy + 58))
        draw_sprite(dialog_portrait, dialog_portrait_index, (tvx + 2 + dialogposition + 3 - 7), (tvy + 33))
        if (dialogtemp != dialog)
        {
            if (dialogfeedtimer == 0)
            {
                if (dialogchatcounter == 0)
                {
                    if audio_is_playing(dialogsound)
                        audio_sound_gain(dialogsound, 0, 15)
                    switch dialog_portrait
                    {
                        case 356:
                            dialogsound = choose(233, 240, 239, 238, 237, 236, 235, 234)
                            break
                        case 361:
                            dialogsound = choose(385, 386, 387, 388)
                            break
                        case 357:
                            dialogsound = choose(241, 242, 243, 244, 245)
                            break
                        case 358:
                            if (MAP_MANAGER.map_current == "map6")
                                dialogsound = choose(289, 290, 291, 292, 293, 294, 295, 296, 297, 298, 299, 300, 301, 302, 303)
                            else
                                dialogsound = choose(248, 249, 250, 251, 252, 253, 254, 255, 256, 262, 257, 258, 259, 260, 261)
                            break
                        case 481:
                            dialogsound = choose(263, 264, 265, 266, 267, 268, 269)
                            break
                        case 473:
                            dialogsound = choose(270, 271, 272, 273, 274, 275)
                            break
                        case 474:
                            dialogsound = choose(270, 271, 272, 273, 274, 275)
                            break
                        case 598:
                            dialogsound = choose(277, 278, 279, 280, 281, 282, 283)
                            break
                        case 599:
                            dialogsound = choose(284, 285, 286, 287, 288)
                            break
                        case 518:
                            dialogsound = choose(344, 345, 346, 347, 348, 349)
                            break
                        case 581:
                            dialogsound = choose(366, 367, 368, 369, 370, 371, 372)
                            break
                        default:
                            dialogsound = UImove
                            break
                    }

                    dialogsound = audio_play_sound(dialogsound, 100, false)
                    audio_sound_pitch(dialogsound, random_range(0.9, 1.2))
                    dialogchatcounter = 2
                }
                else
                    dialogchatcounter--
                dialogfeedtimer = 2
                dialogtemp = string_copy(dialog, 0, (string_length(dialogtemp) + 1))
            }
            else
                dialogfeedtimer--
            scr_draw_dialog_pos(dialogtemp, (tvx + global.text_x_offset + 2 + 27 + dialogposition), (tvy + 28 + global.text_offset))
        }
        else
            scr_draw_dialog_pos(dialog, (tvx + global.text_x_offset + 2 + 27 + dialogposition), (tvy + 28 + global.text_offset))
    }
}
surface_reset_target()
