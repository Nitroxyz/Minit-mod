switch state_step
{
    case 0:
        qu_set_dialogmode()
        player_auto()
        qu_wait(1)
        break
    case 1:
        if global.decoder_discovered
            hud_text_set(20, 356, 1)
        else
            hud_text_set(363, 358, 1)
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
            hud_text_set(428, 474, 1)
            qu_wait(1)
        }
        break
    case 4:
        if qu_trigger()
        {
            hud_text_set(429, 474, 0)
            qu_wait(1)
        }
        break
    case 5:
        if qu_trigger()
        {
            hud_text_set(430, 474, 2)
            qu_wait(1)
        }
        break
    case 6:
        if qu_trigger()
        {
            hud_text_set(431, 474, 1)
            qu_wait(1)
        }
        break
    case 7:
        if qu_trigger()
        {
            hud_text_set(432, 474, 3)
            qu_wait(1)
        }
        break
    case 8:
        if qu_trigger()
        {
            hud_text_set(433, 474, 0)
            qu_wait(1)
        }
        break
    case 9:
        if qu_trigger()
        {
            hud_text_set(434, 474, 2)
            qu_wait(1)
        }
        break
    case 10:
        if qu_trigger()
        {
            hud_text_set(435, 474, 2)
            qu_wait(1)
        }
        break
    case 11:
        if qu_trigger()
        {
            hud_text_set(436, 474, 3)
            qu_wait(1)
        }
        break
    case 12:
        if qu_trigger()
        {
            hud_text_set(437, 474, 2)
            qu_wait(1)
        }
        break
    case 13:
        if qu_trigger()
        {
            hud_text_set(438, 474, 1)
            qu_wait(1)
        }
        break
    case 14:
        if qu_trigger()
        {
            hud_text_set(0, 474, 0)
            qu_wait(1)
        }
        break
    case 15:
        hud_text_set(0, 475, irandom(3))
        if qu_trigger()
        {
            hud_text_reset()
            player_play()
            qu_reset()
        }
        break
}

