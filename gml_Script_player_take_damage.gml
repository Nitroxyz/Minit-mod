var _dmg = argument0
if (control_state == 87 && (!stun) && (!dashing))
{
    GAME_MANAGER.pause_frames = 10
    alarm[3] = 60
    stun = 1
    shake_screen(10)
    if (vehicle == 0)
        player_take_final_hit()
    else if (vehicle == 3)
    {
        audio_play_sound(CatHurt, 100, false)
        audio_sound_pitch(CatHurt, random_range(1, 1.2))
        audio_play_sound(snd_suitHurt, 100, false)
        audio_sound_pitch(snd_suitHurt, random_range(0.9, 1.1))
        shake_screen(30)
        alarm[3] += 60
        player_exit_turret_damaged()
    }
    else if (vehicle == 1)
    {
        audio_play_sound(CatHurt, 100, false)
        audio_sound_pitch(CatHurt, random_range(1, 1.2))
        audio_play_sound(snd_suitHurt, 100, false)
        audio_sound_pitch(snd_suitHurt, random_range(0.9, 1.1))
        global.cur_hp--
        global.cur_hp = clamp(global.cur_hp, 0, global.max_hp)
        UI_takedamage()
        if (global.cur_hp <= 0)
            player_take_final_hit()
    }
    else if (vehicle == 2)
    {
        audio_play_sound(CatHurt, 100, false)
        audio_sound_pitch(CatHurt, random_range(1, 1.2))
        audio_play_sound(snd_suitHurt, 100, false)
        audio_sound_pitch(snd_suitHurt, random_range(0.9, 1.1))
        global.sub_hp--
        global.sub_hp = clamp(global.sub_hp, 0, global.sub_hp_max)
        UI_takedamage()
        if (global.sub_hp <= 0)
            player_take_final_hit()
    }
}
