switch state_step
{
    case 0:
        if (!instance_exists(obj_rebbafade))
        {
            player_auto()
            notify_item_get(spr_hopper_icon, 477)
            qu_wait(20)
        }
        break
    case 1:
        if qu_trigger()
        {
            with (obj_item_notification)
                instance_destroy()
        }
        if (!instance_exists(obj_item_notification))
        {
            qu_wait(1)
            hud_text_set(478, 518, 2)
        }
        break
    case 2:
        qu_wait(1)
        break
    case 3:
        if qu_trigger()
        {
            hud_text_set(479, 518, 2)
            qu_wait(1)
        }
        break
    case 4:
        if qu_trigger()
        {
            hud_text_set_ext(26, 356, 2, "wavy")
            shake_screen(20)
            qu_wait(1)
        }
        break
    case 5:
        if qu_trigger()
        {
            global.items_collected++
            player_play()
            music_duck(1, 1000)
            global.abilities = set_bitwise_flag(global.abilities, 16, 1)
            ability_update()
            qu_set(236)
            obj_controller.state_step = 46
            achievement_set("ACH_HOPPER")
            global.rebba_quest_complete_2 = 1
            save_savefile()
        }
        break
}

