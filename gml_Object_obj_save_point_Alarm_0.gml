if (state == "animate")
{
    if instance_exists(obj_player)
    {
        if ((!mini) && obj_player.vehicle == 0)
        {
            state = "save"
            image_speed = 0.24
            if instance_exists(obj_vacant_suit)
            {
                with (obj_vacant_suit)
                {
                    instance_create(x, y, obj_hidecloud)
                    instance_destroy()
                }
            }
            global.vacant_suit_room[MAP_MANAGER.map_num] = -1
            with (obj_player)
            {
                cat = 0
                stopped = 0
                vehicle = 1
                visible = true
                iindex = 0
                image_xscale = (instance_exists(obj_vacant_suit) ? obj_vacant_suit.image_xscale : image_xscale)
                player_updategundir()
                facing = image_xscale
                sprite_index = spr_player_C
                mask_index = spr_player_C
                x = other.x + other.image_xscale * 24
                while position_meeting(x, bbox_bottom, obj_wall)
                    y--
                obj_gun.visible = true
            }
            state = "save"
            image_speed = 0.24
            save_savefile()
        }
        else
        {
            state = "save"
            image_speed = 0.24
            obj_player.x = x + image_xscale * 24
            save_savefile()
        }
        global.cur_hp = global.max_hp
    }
}
