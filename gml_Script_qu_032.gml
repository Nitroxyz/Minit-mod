switch state_step
{
    case 0:
        qu_set_dialogmode()
        player_auto()
        music_duck(0.5, 2000)
        qu_wait(1)
        break
    case 1:
        player_auto()
        hud_text_set(259, 358, 2)
        qu_wait(1)
        break
    case 2:
        if qu_trigger()
        {
            hud_text_set(260, 358, 2)
            qu_wait(1)
        }
        break
    case 3:
        if qu_trigger()
        {
            hud_text_set(261, 358, 0)
            qu_wait(1)
        }
        break
    case 4:
        if qu_trigger()
        {
            hud_text_set(262, 358, 0)
            qu_wait(1)
        }
        break
    case 5:
        if qu_trigger()
        {
            hud_text_set(263, 358, 2)
            qu_wait(1)
        }
        break
    case 6:
        if qu_trigger()
        {
            hud_text_set(287, 356, 1)
            qu_wait(1)
        }
        break
    case 7:
        if qu_trigger()
        {
            shake_screen(10)
            hud_text_set(264, 358, 2)
            qu_wait(1)
        }
        break
    case 8:
        if qu_trigger()
        {
            shake_screen(10)
            hud_text_set(156, 358, 0)
            qu_wait(1)
        }
        break
    case 9:
        if qu_trigger()
        {
            hud_text_reset()
            music_duck(1, 2000)
            player_play()
            qu_reset()
            achievement_set("ACH_VENTS")
        }
        break
}

