if (instance_exists(obj_changeroom) || collision_state == scr_none)
    return;
script_execute(control_state)
script_execute(move_state)
script_execute(shoot_state)
if (global.minit_mode > 0 && global.minit_active == 1)
{
    var cof = minit_time_calc() * 60 - (max((GAME_MANAGER.second_timer - 1), 0)) - 33
    if (global.minit_reset == 1)
        cof = round(cof / 60)
    if (((cof <= 600 && round(cof / 60) == (cof / 60)) || (cof <= 180 && round(cof / 15) == (cof / 15))) && (!instance_exists(minit_ItemGot)))
    {
        if (round(cof / 60) == (cof / 60))
        {
            if ((cof / 60) == 0)
                audio_play_sound(sndClock4, 20, false)
            else if ((cof / 60) <= 3)
                audio_play_sound(sndClock3, 20, false)
            else if ((cof / 60) <= 6)
                audio_play_sound(sndClock2, 20, false)
            else
                audio_play_sound(sndClock1, 20, false)
        }
    }
    if (minit_time_calc() <= 0)
    {
        global.minit_reset = 0
        player_take_final_hit()
    }
}
if (visible && place_meeting(x, y, obj_enemy))
{
    var temp = instance_place(x, y, obj_enemy)
    if (temp.visible == true && sprite_index != spr_sub_enter)
    {
        if (move_state == 67)
        {
            if temp.spinhurt
                player_take_damage(temp.atk)
            else if (!spinhit)
            {
                instance_create(((x + temp.x) / 2), ((y + temp.y) / 2), obj_spinwhack)
                spinhit = 1
                catmood_update(5, 15)
                var _sfx = audio_play_sound(snd_spin_jump_hit, 5, false)
                audio_sound_pitch(_sfx, (hopper ? random_range(0.9, 1.3) : random_range(1.5, 1.7)))
                with (temp)
                {
                    hurt_hspd = other.hspd
                    hurt_vspd = other.vspd
                    hurt = 1
                    enemy_take_damage((other.hopper ? 3 : 1), 0, 1)
                }
            }
            if (alarm[6] == -1)
            {
                var _dir = point_direction(temp.x, temp.y, x, y)
                vspd = lengthdir_y((mech_jumpspd * 1.25), _dir)
                hspd = lengthdir_x((mech_jumpspd * 0.75), _dir)
                alarm[6] = 10
            }
        }
        else
        {
            if (control_state == 87 && (!stun) && (!dashing))
                instance_create(((x + temp.x) / 2), ((y + temp.y) / 2), obj_hitpow)
            player_take_damage(temp.atk)
        }
        if instance_exists(temp)
        {
            if (temp.destroyontouch == 1)
            {
                with (temp)
                    enemy_event_die()
            }
        }
    }
}
check_water()
if place_meeting(x, y, obj_rocketboom)
{
    var z = instance_place(x, y, obj_rocketboom)
    if z.pushplayer
    {
        if (z.y < (y - 8))
            vspd = 0
        else
            vspd = (-mech_jumpspd) * 1
        z.pushplayer = 0
    }
}
if stun
{
    if round(((alarm[3] / 4) % 2) == 0)
        image_blend = c_black
    else if round(((alarm[3] / 4) % 2) == 1)
        image_blend = c_white
}
else
    image_blend = c_white
script_execute(collision_state)
if stun
{
    if (hp <= 0)
    {
    }
}
iindex_set()
if (alarm[0] > 0)
    alarm[0]--
else if (alarm[0] == 0)
{
    alarm[0] = -1
    step = 1
}
if (alarm[1] > 0)
    alarm[1]--
else if (alarm[1] == 0)
{
    alarm[1] = -1
    if (vehicle == 1)
        shoot_state = 84
    else if (vehicle == 0)
        shoot_state = 2
    else if (vehicle == 2)
        shoot_state = 86
}
if (alarm[2] > 0)
    alarm[2]--
else if (alarm[2] == 0)
{
    alarm[2] = -1
    dashing = 0
}
if (alarm[3] > 0)
{
    alarm[3]--
    if (alarm[3] > 45)
    {
        if (vehicle == 1)
            sprite_index = spr_mech_hurt
    }
}
else if (alarm[3] == 0)
{
    alarm[3] = -1
    stun = 0
    if (hp < 1)
    {
        if instance_exists(obj_hud)
        {
            if obj_hud.dialog_mode
            {
                hp = 1
                if audio_is_playing(snd_cat_deathcry)
                    audio_stop_sound(snd_cat_deathcry)
                room_speed = 60
            }
        }
    }
}
if (alarm[4] > 0)
    alarm[4]--
else if (alarm[4] == 0)
{
    alarm[4] = -1
    global.catmood = 0
}
if (alarm[5] > 0)
    alarm[5]--
else if (alarm[5] == 0)
{
    alarm[5] = -1
    if (control_state == 2)
        alarm[5] = 20
    else
    {
        if (instance_place(x, y, obj_lavatop) && vehicle == 0)
            alarm[5] = choose(30, 120)
        create_particles((x + 4 * image_xscale), y, obj_water_bubble_catbreath, floor(random(1.2) + 1))
    }
}
if (alarm[6] > 0)
    alarm[6]--
else if (alarm[6] == 0)
{
    alarm[6] = -1
    spinhit = 0
    if (move_state == 67)
    {
        move_state = 66
        audio_play_sound(snd_spin_jump_ready, 5, false)
    }
}
