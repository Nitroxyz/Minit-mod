switch state_step
{
    case 0:
        qu_set_dialogmode()
        player_auto()
        qu_wait(1)
        break
    case 1:
        hud_text_set(336, 358, 1)
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
            hud_text_set(347, 481, 1)
            qu_wait(1)
        }
        break
    case 4:
        if qu_trigger()
        {
            hud_text_set(348, 481, 3)
            qu_wait(1)
        }
        break
    case 5:
        if qu_trigger()
        {
            hud_text_set("terrifying.", 481, 2)
            qu_wait(1)
        }
        break
    case 6:
        if qu_trigger()
        {
            hud_text_set("That being said, I can't rid myself of a feeling of pride.", 481, 1)
            qu_wait(1)
        }
        break
    case 7:
        if qu_trigger()
        {
            hud_text_set("I truly am an excellent engineer. Despite that,", 481, 0)
            qu_wait(1)
        }
        break
    case 8:
        if qu_trigger()
        {
            hud_text_set("they still send ME instead of the maintanance crew", 481, 1)
            qu_wait(1)
        }
        break
    case 9:
        if qu_trigger()
        {
            hud_text_set("to repair this faulty Heater Core.", 481, 2)
            qu_wait(1)
        }
        break
    case 10:
        if qu_trigger()
        {
            hud_text_set("Humiliatingly below my paygrade.", 481, 3)
            qu_wait(1)
        }
        break
    case 11:
        if qu_trigger()
        {
            hud_text_set("Speaking of which...", 481, 0)
            qu_wait(1)
        }
        break
    case 12:
        if qu_trigger()
        {
            hud_text_set("They dropped off a very sweet dog to my lab the other day.", 481, 1)
            qu_wait(1)
        }
        break
    case 13:
        if qu_trigger()
        {
            hud_text_set("They called it defective and told me to make one of my...", 481, 2)
            qu_wait(1)
        }
        break
    case 14:
        if qu_trigger()
        {
            hud_text_set("'Freak Creations' out of it. Or something of the like.", 481, 3)
            qu_wait(1)
        }
        break
    case 15:
        if qu_trigger()
        {
            hud_text_set("A misunderstood creature, not unlike myself.", 481, 3)
            qu_wait(1)
        }
        break
    case 16:
        if qu_trigger()
        {
            hud_text_set("He is easily more intelligent than most of my colleagues.", 481, 2)
            qu_wait(1)
        }
        break
    case 17:
        if qu_trigger()
        {
            hud_text_set("The dog seems to like me. I have yet to name him.", 481, 1)
            qu_wait(1)
        }
        break
    case 18:
        if qu_trigger()
        {
            hud_text_set("", 481, 1)
            qu_wait(1)
        }
        break
    case 19:
        hud_text_set("", 480, irandom(3))
        if qu_trigger()
        {
            hud_text_reset()
            player_play()
            qu_reset()
        }
        break
}

