switch state
{
    case 0:
        animate_actor()
        if (floor(iindex) == (sprite_get_number(sprite_index) - 1))
        {
            if (sprite_index == spr_plr_vacant_suit)
            {
                if (gunplat != self)
                    gunplat.x -= 1000
                if (!(place_meeting(x, (y + 1), obj_wall)))
                {
                    state = 1
                    if (gunplat != self)
                    {
                        with (gunplat)
                            instance_destroy()
                        gunplat = self
                    }
                }
                else if (gunplat != self)
                    gunplat.x += 1000
                image_speed = 0
                iindex = image_number - 1
                if (state == 0)
                    state = 2
            }
            else
            {
                image_speed = 0
                if instance_exists(obj_player)
                {
                    with (obj_player)
                    {
                        cat = 0
                        vehicle = 1
                        stopped = 0
                        visible = true
                        image_xscale = obj_vacant_suit.image_xscale
                        facing = image_xscale
                        x = obj_vacant_suit.x
                        y = obj_vacant_suit.y
                        move_state = 65
                        shoot_state = 84
                        player_play()
                        mask_index = spr_player_C
                        obj_gun.visible = true
                    }
                }
                visible = false
                instance_destroy()
            }
        }
        if (gunplat != self)
        {
            if (instance_exists(obj_player) && instance_exists(gunplat))
            {
                if (obj_player.vspd < 0)
                {
                    with (gunplat)
                        instance_destroy()
                    gunplat = self
                }
                else
                {
                    gunplat.mask_index = spr_suit_platform
                    with (gunplat)
                    {
                        if place_meeting(x, y, obj_player)
                            mask_index = spr_none
                    }
                }
            }
        }
        break
    case 1:
        if ((!(place_meeting(x, (y + 1), obj_wall))) && (!(place_meeting(x, (y + 1), obj_bridgenode))))
        {
            if (gunplat != self)
            {
                with (gunplat)
                    instance_destroy()
                gunplat = self
            }
            y += vspd
            if (place_meeting(x, y, obj_wall) || place_meeting(x, y, obj_bridgenode))
            {
                y = round(y)
                while (place_meeting(x, y, obj_wall) || place_meeting(x, y, obj_bridgenode))
                    y--
            }
            vspd = min((vspd + 0.1), 6)
        }
        else
        {
            global.vacant_suit_x[MAP_MANAGER.map_num] = obj_vacant_suit.x
            global.vacant_suit_y[MAP_MANAGER.map_num] = obj_vacant_suit.y
            vspd = 0
            state = 0
        }
        break
    case 2:
        mask_index = sprite_index
        if (gunplat != self && instance_exists(obj_player))
        {
            if (obj_player.vspd < 0)
            {
                if instance_exists(gunplat)
                {
                    with (gunplat)
                        instance_destroy()
                    gunplat = -1
                }
            }
        }
        if place_meeting(x, y, obj_player)
        {
            if (point_distance(x, y, obj_player.x, obj_player.y) < 10)
            {
                if (obj_player.vehicle == 0 && sprite_index == spr_plr_vacant_suit && image_speed == 0)
                {
                    player_auto()
                    obj_player.visible = false
                    sprite_index = spr_plr_vacant_suit_enter
                    image_speed = 0.3
                    iindex = 0
                    audio_play_sound(EnterSuit, 100, false)
                    audio_sound_pitch(EnterSuit, random_range(0.9, 1.1))
                    UI_entermech()
                    state = 0
                }
            }
        }
        break
}

