if (!turret_is_damaged)
{
    if cat_is_touching
    {
        if (!(place_meeting(x, y, obj_player)))
            cat_is_touching = 0
        return;
    }
    shoot_angle = point_direction(0, 0, image_xscale, (-image_yscale))
    var player = instance_place(x, y, obj_player)
    if player
    {
        if (player.vehicle == 0)
        {
            player.vehicle = 3
            player.move_state = 98
            player.old_move_state = 101
            player.shoot_state = 2
            player.hspd = 0
            player.vspd = 0
            player.shooting = 0
            player.cat = 0
            player.x = x
            player.y = y
            player.mask_index = spr_mask_none
            player.image_xscale = image_xscale
            player.image_yscale = image_yscale
            player.turret_shoot_energy = 0
            player.turret_shoot_direction = shoot_angle
            player.sprite_index = spr_turret_enter
            player.iindex = 0
            player.image_speed = 0
            audio_play_sound(EnterSuit, 100, false)
            audio_sound_pitch(EnterSuit, random_range(0.9, 1.1))
            instance_destroy()
        }
    }
}
else if (turret_damage_timer > 0)
{
    if ((turret_damage_timer % 10) == 0 || ((turret_damage_timer % 12) == 0 && irandom(3) == 0))
    {
        var t = instance_create(x, y, obj_steam_cloud)
        t.hspd = abs(t.hspd) * image_xscale
    }
    turret_damage_timer--
}
else
{
    turret_damage_timer = turret_damage_timer_max
    turret_is_damaged = 0
}
