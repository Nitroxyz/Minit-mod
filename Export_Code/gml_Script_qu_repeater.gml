switch state_step
{
    case 0:
        if (!instance_exists(obj_rebbafade))
        {
            player_auto()
            notify_item_get(spr_repeater_icon, 480)
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
            choose_dialog_button("X")
            hud_text_set(482, 518, 2)
            qu_wait(1)
        }
        break
    case 2:
        qu_wait(1)
        break
    case 3:
        if qu_trigger()
        {
            hud_text_set_ext(26, 356, 2, "wavy")
            shake_screen(20)
            qu_wait(1)
        }
        break
    case 4:
        qu_wait(1)
        break
    case 5:
        if qu_trigger()
        {
            global.items_collected++
            player_play()
            music_duck(1, 1000)
            global.gunEquip = set_bitwise_flag(global.gunEquip, 8, 1)
            ability_update()
            qu_set(236)
            obj_controller.state_step = 31
            achievement_set("ACH_REPEATER")
            global.rebba_quest_complete_1 = 1
            save_savefile()
        }
        break
}

