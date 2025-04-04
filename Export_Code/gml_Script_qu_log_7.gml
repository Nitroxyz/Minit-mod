switch state_step
{
    case 0:
        qu_set_dialogmode()
        player_auto()
        qu_wait(1)
        break
    case 1:
        hud_text_set(20, 356, 1)
        qu_wait(1)
        break
    case 2:
        if qu_trigger()
        {
            hud_text_set(511, 681, irandom(3))
            qu_wait(1)
        }
        break
    case 3:
        obj_hud.dialog_portrait_index = irandom(3)
        if qu_trigger()
        {
            hud_text_set(114, 681, irandom(3))
            qu_wait(1)
        }
        break
    case 4:
        obj_hud.dialog_portrait_index = irandom(3)
        if qu_trigger()
        {
            hud_text_set(511, 681, irandom(3))
            qu_wait(1)
        }
        break
    case 5:
        obj_hud.dialog_portrait_index = irandom(3)
        if qu_trigger()
        {
            hud_text_reset()
            player_play()
            qu_reset()
        }
        break
}

