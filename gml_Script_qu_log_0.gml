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
            hud_text_set(0, 480, irandom(3))
            qu_wait(1)
        }
        break
    case 3:
        hud_text_set(0, 480, irandom(3))
        if qu_trigger()
        {
            hud_text_set(364, 481, 1)
            qu_wait(1)
        }
        break
    case 4:
        if qu_trigger()
        {
            hud_text_set(365, 481, 3)
            qu_wait(1)
        }
        break
    case 5:
        if qu_trigger()
        {
            hud_text_set(366, 481, 1)
            qu_wait(1)
        }
        break
    case 6:
        if qu_trigger()
        {
            hud_text_set(367, 481, 1)
            qu_wait(1)
        }
        break
    case 7:
        if qu_trigger()
        {
            hud_text_set(368, 481, 0)
            qu_wait(1)
        }
        break
    case 8:
        if qu_trigger()
        {
            hud_text_set(369, 481, 1)
            qu_wait(1)
        }
        break
    case 9:
        if qu_trigger()
        {
            hud_text_set(370, 481, 2)
            qu_wait(1)
        }
        break
    case 10:
        if qu_trigger()
        {
            hud_text_set(371, 481, 3)
            qu_wait(1)
        }
        break
    case 11:
        if qu_trigger()
        {
            hud_text_set(372, 481, 0)
            qu_wait(1)
        }
        break
    case 12:
        if qu_trigger()
        {
            hud_text_set(373, 481, 0)
            qu_wait(1)
        }
        break
    case 13:
        if qu_trigger()
        {
            hud_text_set(0, 481, 0)
            qu_wait(1)
        }
        break
    case 14:
        hud_text_set(0, 480, irandom(3))
        if qu_trigger()
        {
            hud_text_reset()
            player_play()
            qu_reset()
        }
        break
}

