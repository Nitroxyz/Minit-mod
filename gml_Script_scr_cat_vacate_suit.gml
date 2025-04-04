if (!instance_exists(obj_vacant_suit))
{
    UI_exitmech()
    instance_create(x, y, obj_vacant_suit)
    obj_vacant_suit.image_xscale = image_xscale
    x += (sign(image_xscale) * 15)
    audio_play_sound(ExitSuit, 100, false)
    audio_sound_pitch(ExitSuit, random_range(0.8, 0.9))
    global.vacant_suit = obj_vacant_suit.id
    global.vacant_suit_room[MAP_MANAGER.map_num] = global.current_room
}
else if (obj_vacant_suit.image_speed == 0)
{
    global.vacant_suit_x[MAP_MANAGER.map_num] = obj_vacant_suit.x
    global.vacant_suit_y[MAP_MANAGER.map_num] = obj_vacant_suit.y
    global.vacant_suit_xscale[MAP_MANAGER.map_num] = obj_vacant_suit.image_xscale
    var temp = instance_create(obj_vacant_suit.x, (obj_vacant_suit.y + 2), obj_wall)
    temp.image_xscale = obj_vacant_suit.image_xscale
    temp.sprite_index = spr_suit_platform
    temp.mask_index = spr_suit_platform
    temp.visible = false
    obj_vacant_suit.gunplat = temp.id
    y = temp.y - 6
    audio_play_sound(CatMeow, 100, false)
    with (obj_player)
    {
        sprite_index = spr_cat_idle
        visible = true
        collision_state = 58
        move_state = 69
        old_shoot_state = 2
        shoot_state = 2
        vehicle = 0
        while place_meeting(x, y, obj_wall)
            y--
    }
    if (obj_hud.dialog_mode == 0)
        player_play()
    else
    {
        obj_player.move_state = 69
        player_auto()
    }
    with (temp)
    {
        if place_meeting((x + image_xscale * 12), y, obj_wall)
            obj_vacant_suit.gunplatblocked = 1
        else if (instance_exists(obj_player) && place_meeting((obj_player.x + obj_player.image_xscale * 12), obj_player.y, obj_wall))
            obj_vacant_suit.gunplatblocked = 1
        else if (instance_exists(obj_player) && place_meeting((obj_player.x + obj_player.image_xscale * 12), obj_player.y, obj_shootdoor))
            obj_vacant_suit.gunplatblocked = 1
    }
}
