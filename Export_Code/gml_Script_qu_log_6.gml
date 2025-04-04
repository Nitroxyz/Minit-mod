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
            hud_text_set(0, 359, irandom(3))
            qu_wait(1)
        }
        break
    case 3:
        hud_text_set(0, 359, irandom(3))
        if qu_trigger()
        {
            hud_text_set(439, 358, 0)
            qu_wait(1)
        }
        break
    case 4:
        if qu_trigger()
        {
            hud_text_set(440, 358, 1)
            qu_wait(1)
        }
        break
    case 5:
        if qu_trigger()
        {
            hud_text_set(441, 358, 0)
            qu_wait(1)
        }
        break
    case 6:
        if qu_trigger()
        {
            hud_text_set(442, 358, 3)
            qu_wait(1)
        }
        break
    case 7:
        if qu_trigger()
        {
            hud_text_set(443, 358, 0)
            qu_wait(1)
        }
        break
    case 8:
        if qu_trigger()
        {
            hud_text_set(444, 358, 1)
            qu_wait(1)
        }
        break
    case 9:
        if qu_trigger()
        {
            hud_text_set(445, 358, 0)
            qu_wait(1)
        }
        break
    case 10:
        if qu_trigger()
        {
            hud_text_set(446, 358, 3)
            qu_wait(1)
        }
        break
    case 11:
        if qu_trigger()
        {
            hud_text_set(447, 358, 0)
            qu_wait(1)
        }
        break
    case 12:
        if qu_trigger()
        {
            hud_text_set(448, 358, 0)
            qu_wait(1)
        }
        break
    case 13:
        if qu_trigger()
        {
            hud_text_set(449, 358, 1)
            qu_wait(1)
        }
        break
    case 14:
        if qu_trigger()
        {
            hud_text_set(450, 358, 0)
            qu_wait(1)
        }
        break
    case 15:
        if qu_trigger()
        {
            hud_text_set(451, 358, 2)
            qu_wait(1)
        }
        break
    case 16:
        if qu_trigger()
        {
            hud_text_set(452, 358, 1)
            qu_wait(1)
        }
        break
    case 17:
        if qu_trigger()
        {
            hud_text_set(453, 358, 0)
            qu_wait(1)
        }
        break
    case 18:
        if qu_trigger()
        {
            hud_text_set(454, 356, 1)
            qu_wait(1)
        }
        break
    case 19:
        if qu_trigger()
        {
            hud_text_set(0, 358, 0)
            qu_wait(1)
        }
        break
    case 20:
        hud_text_set(0, 359, irandom(3))
        if qu_trigger()
        {
            hud_text_reset()
            player_play()
            qu_reset()
        }
        break
}

