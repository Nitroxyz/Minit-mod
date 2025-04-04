switch state_step
{
    case 0:
        instance_create(184, 169, obj_mouse)
        obj_mouse.image_speed = 0.2
        qu_face(obj_mouse, 1)
        qu_set_dialogmode()
        qu_wait(1)
        break
    case 1:
        if instance_exists(obj_player)
        {
            if (obj_player.x > 96 && obj_player.grounded)
            {
                music_duck(0.6, 1000)
                player_auto()
                qu_wait(20)
                qu_face(obj_mouse, sign(obj_player.x - obj_mouse.x))
                qu_face(obj_player, sign(obj_mouse.x - obj_player.x))
                player_updategundir()
            }
        }
        break
    case 2:
        hud_text_set(35, 357, 1)
        qu_wait(1)
        break
    case 3:
        if qu_trigger()
        {
            hud_text_set(49, 356, 2)
            qu_wait(1)
        }
        break
    case 4:
        if qu_trigger()
        {
            hud_text_set(58, 357, 0)
            qu_wait(1)
        }
        break
    case 5:
        if qu_trigger()
        {
            music_duck(1, 1000)
            hud_text_reset()
            player_play()
            qu_reset()
        }
        break
}

