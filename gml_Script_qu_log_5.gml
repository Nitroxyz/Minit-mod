switch state_step
{
    case 0:
        qu_set_dialogmode()
        player_auto()
        qu_wait(1)
        break
    case 1:
        hud_text_set(20, 356, 0)
        qu_wait(1)
        break
    case 2:
        if qu_trigger()
        {
            hud_text_set(0, 475, irandom(3))
            qu_wait(1)
        }
        break
    case 3:
        hud_text_set(0, 475, irandom(3))
        if qu_trigger()
        {
            hud_text_set(414, 473, 1)
            qu_wait(1)
        }
        break
    case 4:
        if qu_trigger()
        {
            hud_text_set(415, 473, 3)
            qu_wait(1)
        }
        break
    case 5:
        if qu_trigger()
        {
            hud_text_set(416, 473, 2)
            qu_wait(1)
        }
        break
    case 6:
        if qu_trigger()
        {
            hud_text_set(417, 473, 1)
            qu_wait(1)
        }
        break
    case 7:
        if qu_trigger()
        {
            hud_text_set(418, 473, 0)
            qu_wait(1)
        }
        break
    case 8:
        if qu_trigger()
        {
            hud_text_set(419, 473, 1)
            qu_wait(1)
        }
        break
    case 9:
        if qu_trigger()
        {
            hud_text_set(420, 473, 2)
            qu_wait(1)
        }
        break
    case 10:
        if qu_trigger()
        {
            hud_text_set(421, 473, 3)
            qu_wait(1)
        }
        break
    case 11:
        if qu_trigger()
        {
            hud_text_set(422, 473, 0)
            qu_wait(1)
        }
        break
    case 12:
        if qu_trigger()
        {
            hud_text_set(423, 473, 0)
            qu_wait(1)
        }
        break
    case 13:
        if qu_trigger()
        {
            hud_text_set(424, 473, 1)
            qu_wait(1)
        }
        break
    case 14:
        if qu_trigger()
        {
            hud_text_set(425, 473, 2)
            qu_wait(1)
        }
        break
    case 15:
        if qu_trigger()
        {
            hud_text_set(426, 473, 3)
            qu_wait(1)
        }
        break
    case 16:
        if qu_trigger()
        {
            hud_text_set(427, 473, 3)
            qu_wait(1)
        }
        break
    case 17:
        if qu_trigger()
        {
            hud_text_set(0, 473, 1)
            qu_wait(1)
        }
        break
    case 18:
        hud_text_set(0, 475, irandom(3))
        if qu_trigger()
        {
            hud_text_reset()
            player_play()
            qu_reset()
        }
        break
}

