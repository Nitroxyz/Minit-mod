if (!stun)
{
    var snd = audio_play_sound(CatHurt, 100, false)
    audio_sound_pitch(snd, random_range(0.8, 1.2))
    hp -= 2
    shake_screen(10)
    stun = 1
    alarm[3] = 60
    if (hp <= 0)
        player_take_final_hit()
    if (move_state == 72)
    {
        alarm[5] = 8
        vspd = -0.75 * jumpspeed
    }
    else if (!grounded)
    {
        move_state = 70
        vspd = -1.5 * jumpspeed
    }
}
