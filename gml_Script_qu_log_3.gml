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
            hud_text_set(391, 481, 1)
            qu_wait(1)
        }
        break
    case 4:
        if qu_trigger()
        {
            hud_text_set(392, 481, 3)
            qu_wait(1)
        }
        break
    case 5:
        if qu_trigger()
        {
            hud_text_set(393, 481, 2)
            qu_wait(1)
        }
        break
    case 6:
        if qu_trigger()
        {
            hud_text_set(394, 481, 1)
            qu_wait(1)
        }
        break
    case 7:
        if qu_trigger()
        {
            hud_text_set(395, 481, 0)
            qu_wait(1)
        }
        break
    case 8:
        if qu_trigger()
        {
            hud_text_set(396, 481, 1)
            qu_wait(1)
        }
        break
    case 9:
        if qu_trigger()
        {
            hud_text_set(397, 481, 2)
            qu_wait(1)
        }
        break
    case 10:
        if qu_trigger()
        {
            hud_text_set(398, 481, 3)
            qu_wait(1)
        }
        break
    case 11:
        if qu_trigger()
        {
            hud_text_set(399, 481, 0)
            qu_wait(1)
        }
        break
    case 12:
        if qu_trigger()
        {
            hud_text_set(400, 481, 1)
            qu_wait(1)
        }
        break
    case 13:
        if qu_trigger()
        {
            hud_text_set(401, 481, 2)
            qu_wait(1)
        }
        break
    case 14:
        if qu_trigger()
        {
            hud_text_set(402, 481, 3)
            qu_wait(1)
        }
        break
    case 15:
        if qu_trigger()
        {
            hud_text_set(403, 481, 3)
            qu_wait(1)
        }
        break
    case 16:
        if qu_trigger()
        {
            hud_text_set(404, 481, 3)
            qu_wait(1)
        }
        break
    case 17:
        if qu_trigger()
        {
            hud_text_set(405, 481, 3)
            qu_wait(1)
        }
        break
    case 18:
        if qu_trigger()
        {
            hud_text_set(406, 481, 3)
            qu_wait(1)
        }
        break
    case 19:
        if qu_trigger()
        {
            hud_text_set(407, 481, 2)
            qu_wait(1)
        }
        break
    case 20:
        if qu_trigger()
        {
            hud_text_set(408, 481, 1)
            qu_wait(1)
        }
        break
    case 21:
        if qu_trigger()
        {
            hud_text_set(409, 361, 0)
            qu_wait(1)
        }
        break
    case 22:
        if qu_trigger()
        {
            hud_text_set(410, 481, 1)
            qu_wait(1)
        }
        break
    case 23:
        if qu_trigger()
        {
            hud_text_set(411, 361, 1)
            qu_wait(1)
        }
        break
    case 24:
        if qu_trigger()
        {
            hud_text_set(412, 481, 1)
            qu_wait(1)
        }
        break
    case 25:
        if qu_trigger()
        {
            hud_text_set(413, 481, 0)
            qu_wait(1)
        }
        break
    case 26:
        if qu_trigger()
        {
            hud_text_set(0, 481, 1)
            qu_wait(1)
        }
        break
    case 27:
        hud_text_set(0, 480, irandom(3))
        if qu_trigger()
        {
            hud_text_reset()
            player_play()
            qu_reset()
        }
        break
}

