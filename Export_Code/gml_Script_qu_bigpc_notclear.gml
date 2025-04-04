switch state_step
{
    case 0:
        qu_set_dialogmode()
        player_auto()
        hud_text_set(69, 358, 0)
        qu_wait(1)
        break
    case 1:
        if qu_trigger()
        {
            hud_text_set(70, 581, 5)
            qu_wait(1)
        }
        break
    case 2:
        if qu_trigger()
        {
            hud_text_set(71, 581, 0)
            qu_wait(1)
        }
        break
    case 3:
        if qu_trigger()
        {
            hud_text_set(72, 358, 1)
            qu_wait(1)
        }
        break
    case 4:
        if qu_trigger()
        {
            hud_text_set(73, 581, 6)
            qu_wait(1)
        }
        break
    case 5:
        if qu_trigger()
        {
            hud_text_set(74, 358, 0)
            qu_wait(1)
        }
        break
    case 6:
        if qu_trigger()
        {
            hud_text_set(75, 581, 1)
            qu_wait(1)
        }
        break
    case 7:
        if qu_trigger()
        {
            hud_text_set(76, 581, 0)
            qu_wait(1)
        }
        break
    case 8:
        if qu_trigger()
        {
            hud_text_set(77, 581, 7)
            qu_wait(1)
        }
        break
    case 9:
        if qu_trigger()
        {
            hud_text_set(511, 358, 0)
            qu_wait(1)
        }
        break
    case 10:
        if qu_trigger()
        {
            hud_text_set(78, 581, 0)
            qu_wait(1)
        }
        break
    case 11:
        if qu_trigger()
        {
            if (global.water_level >= 3)
                hud_text_set(79, 581, 2)
            else
                hud_text_set(80, 581, 3)
            qu_wait(1)
        }
        break
    case 12:
        if qu_trigger()
        {
            if global.lava_cooled
                hud_text_set(81, 581, 1)
            else
                hud_text_set(82, 581, 4)
            qu_wait(1)
        }
        break
    case 13:
        if qu_trigger()
        {
            if (global.vents_cleared >= 3)
                hud_text_set(83, 581, 0)
            else
                hud_text_set(84, 581, 5)
            qu_wait(1)
        }
        break
    case 14:
        if qu_trigger()
        {
            hud_text_set(85, 581, 1)
            qu_wait(1)
        }
        break
    case 15:
        if qu_trigger()
        {
            hud_text_set(86, 358, 0)
            qu_wait(1)
        }
        break
    case 16:
        if qu_trigger()
        {
            global.bigpc_discovered = 1
            hud_text_reset()
            player_play()
            qu_reset()
        }
        break
}

