if (air == 1)
{
    air = 0
    if abs(hspd <= 0.1)
    {
        sprite_index = spr_player_idle
        image_index = 0
        image_speed = 0.1
    }
    audio_play_sound(snd_land, 1, false)
    create_particles(x, bbox_bottom, particle_dust_land, random_range(4, 6))
}
if (floor(iindex) == 0 || floor(iindex) == 4)
{
    if (step && last_step != floor(iindex))
    {
        if (abs(hspd) > 1)
            create_particles(x, bbox_bottom, particle_dust_walk, random_range(1, 2))
        if (sprite_index != spr_player_idle)
        {
            audio_play_sound(snd_walk, 1, false)
            audio_sound_pitch(snd_walk, random_range(0.9, 1.1))
            step = 0
            last_step = floor(iindex)
        }
    }
}
if (sprite_index != spr_player_idle && (floor(iindex) == 1 || floor(iindex) == 4))
    step = 1
if (abs(hspd) > 0.1)
{
    if (sprite_index == spr_player_idle)
        sprite_index = spr_player_C
    image_speed = max(0.1, (abs(hspd) * 0.12))
}
else if (sprite_index != spr_player_idle)
{
    if (!((key_right || key_left)))
    {
        sprite_index = spr_player_idle
        image_speed = 0.1
        last_step = -1
    }
}
else if (key_left || key_right)
{
    sprite_index = spr_player_C
    image_speed = 0
    last_step = -1
}
if key_jump
{
    grounded = 0
    move_state = 66
    sprite_index = spr_plr_jump
    image_index = 0
    image_speed = 0
    audio_play_sound(snd_jump, 1, false)
    audio_sound_pitch(snd_jump, random_range(0.6, 1))
    create_particles(x, y, particle_dust_jump, 5)
    vspd = (-jumpspeed)
    plat_id = -1
    p_type = -1
    p_x = -1
}
if (move_state == 65)
{
    if scr_plr_dash()
        return;
}
if (vspd < 0 && (!key_jump_held))
    vspd = max(vspd, ((-jumpspeed) / 4))
if (!dashing)
{
    vspd += grav
    vspd = median(-4, vspd, 30)
}
else
    vspd = 0
xaxis = key_right - key_left
hspd = approach(hspd, (mech_movespd * xaxis), mech_accel)
if (xaxis != 0)
{
    facing = xaxis
    image_xscale = xaxis
}
else if grounded
{
}
else
    hspd = approach(hspd, 0, mech_air_drag)
if (sign(xaxis) == (-sign(hspd)))
    hspd = approach(hspd, (mech_movespd * xaxis), mech_accel)
if (!dashing)
{
    if (!shooting)
        hspd = median((-mech_movespd), hspd, mech_movespd)
    else
        hspd = clamp(hspd, ((-mech_movespd) + shoot_slow), (mech_movespd - shoot_slow))
}
if (!(place_meeting(x, (y + 1), obj_wall)))
{
    grounded = 0
    move_state = 66
    sliptimer = 4
    image_speed = 0
    sprite_index = spr_plr_jump
    image_index = 0
}
if key_dismount
{
    if ((!(place_meeting(x, (y + 1), obj_demo_end_elevator))) && (!global.hot_room) && (!instance_exists(obj_demo_end_elevator_big)))
    {
        hspd = 0
        vspd = 0
        var _screenEdge = collision_rectangle((bbox_left - 24), bbox_top, (bbox_right + 24), bbox_bottom, obj_switch_room, 0, 0)
        if (!_screenEdge)
        {
            if ((!(place_meeting((x + image_xscale * 16), y, obj_wall))) && plat_id == -1 && (!(collision_rectangle((bbox_left - 16), bbox_top, (bbox_right + 16), bbox_bottom, obj_shootdoor, 0, 0))))
            {
                cat = 1
                player_auto()
                move_state = 75
            }
            else if ((!(place_meeting((x - image_xscale * 16), y, obj_wall))) && plat_id == -1)
            {
                while place_meeting((x + image_xscale * 16), y, obj_wall)
                    x -= sign(image_xscale)
                var _shootDoor = collision_rectangle((bbox_left - 16), bbox_top, (bbox_right + 16), bbox_bottom, obj_shootdoor, 0, 0)
                if _shootDoor
                {
                    if (sign(x - _shootDoor.x) == _shootDoor.image_xscale)
                    {
                        x = _shootDoor.x + _shootDoor.image_xscale * 30
                        _shootDoor.state = 4
                    }
                    else
                    {
                        x = _shootDoor.x + (-_shootDoor.image_xscale) * 30
                        _shootDoor.state = 4
                    }
                }
                cat = 1
                player_auto()
                move_state = 75
                with (obj_shootdoor)
                {
                    if (state != 1)
                    {
                        state = 4
                        timer = timer_max
                    }
                }
            }
        }
    }
    else
        audio_play_sound(snd_suit_exit_cancel, 100, false)
}
