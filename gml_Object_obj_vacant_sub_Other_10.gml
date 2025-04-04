if cat_is_touching
{
    if (!(place_meeting(x, y, obj_player)))
    {
        cat_is_touching = 0
        if (!(place_meeting(x, y, WATER)))
            cat_can_enter = 0
    }
    return;
}
if cat_can_enter
{
    if place_meeting(x, y, obj_player)
    {
        var player = instance_place(x, y, obj_player)
        if (player.vehicle == 0)
        {
            player.in_water = 1
            player.move_state = 82
            player.shoot_state = 2
            player.hspd = 0
            player.vspd = 0
            player.shooting = 0
            player.cat = 0
            player.x = x
            player.y = y - 2
            player.old_move_state = 79
            player.mask_index = spr_player_sub
            player.image_xscale = image_xscale
            player.sprite_index = spr_sub_enter
            player.iindex = 0
            global.sub_hp = hp
            audio_play_sound(EnterSuit, 100, false)
            audio_sound_pitch(EnterSuit, random_range(0.9, 1.1))
            instance_destroy()
            UI_entersub()
        }
    }
    else
    {
        y = ycenter + mag * sin(angle)
        angle = wrap((angle + angle_speed), 0, (2 * pi))
        if (place_meeting(x, y, obj_wall) || (!(place_meeting(x, (y - 8), WATER))))
            y = yprevious
    }
}
