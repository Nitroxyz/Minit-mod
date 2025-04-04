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
            hud_text_set(374, 481, 1)
            qu_wait(1)
        }
        break
    case 4:
        if qu_trigger()
        {
            hud_text_set(375, 481, 3)
            qu_wait(1)
        }
        break
    case 5:
        if qu_trigger()
        {
            hud_text_set(376, 481, 2)
            qu_wait(1)
        }
        break
    case 6:
        if qu_trigger()
        {
            hud_text_set(377, 481, 1)
            qu_wait(1)
        }
        break
    case 7:
        if qu_trigger()
        {
            hud_text_set(378, 481, 0)
            qu_wait(1)
        }
        break
    case 8:
        if qu_trigger()
        {
            hud_text_set(379, 481, 1)
            qu_wait(1)
        }
        break
    case 9:
        if qu_trigger()
        {
            hud_text_set(380, 481, 2)
            qu_wait(1)
        }
        break
    case 10:
        if qu_trigger()
        {
            hud_text_set(381, 481, 3)
            qu_wait(1)
        }
        break
    case 11:
        if qu_trigger()
        {
            hud_text_set(382, 481, 0)
            qu_wait(1)
        }
        break
    case 12:
        if qu_trigger()
        {
            hud_text_set(383, 481, 1)
            qu_wait(1)
        }
        break
    case 13:
        if qu_trigger()
        {
            hud_text_set(384, 481, 2)
            qu_wait(1)
        }
        break
    case 14:
        if qu_trigger()
        {
            hud_text_set(385, 481, 3)
            qu_wait(1)
        }
        break
    case 15:
        if qu_trigger()
        {
            hud_text_set(386, 481, 3)
            qu_wait(1)
        }
        break
    case 16:
        if qu_trigger()
        {
            hud_text_set(387, 481, 2)
            qu_wait(1)
        }
        break
    case 17:
        if qu_trigger()
        {
            hud_text_set(388, 481, 1)
            qu_wait(1)
        }
        break
    case 18:
        if qu_trigger()
        {
            hud_text_set(389, 361, 1)
            qu_wait(1)
        }
        break
    case 19:
        if qu_trigger()
        {
            hud_text_set(390, 481, 0)
            qu_wait(1)
        }
        break
    case 20:
        if qu_trigger()
        {
            hud_text_set(0, 481, 1)
            qu_wait(1)
        }
        break
    case 21:
        hud_text_set(0, 480, irandom(3))
        if qu_trigger()
        {
            hud_text_reset()
            player_play()
            qu_reset()
        }
        break
}

