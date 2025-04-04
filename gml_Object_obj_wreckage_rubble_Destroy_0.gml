if (!c_destroy)
{
    if audio_is_playing(GrenadeExplode)
    {
    }
    var t0 = audio_play_sound(GrenadeExplode, 100, false)
    audio_sound_pitch(t0, random_range(0.5, 0.6))
    audio_sound_gain(t0, (audio_sound_get_gain(t0) / 1.4), 0)
    if audio_is_playing(GrenadeBlowup_Layer2)
        audio_stop_sound(GrenadeBlowup_Layer2)
    var t1 = audio_play_sound(GrenadeBlowup_Layer2, 100, false)
    audio_sound_pitch(t1, random_range(0.4, 0.6))
    audio_sound_gain(t1, (audio_sound_get_gain(t1) / 2), 0)
    var ttt = audio_play_sound(rock_crumble, 100, false)
    audio_sound_pitch(ttt, random_range(0.8, 1.2))
    for (i = 0; i < 16; i++)
    {
        temp = instance_create((x + (random(i) / 4 + 4) * (random_range(-2, 2))), (y + (random(i) / 5 + 4) * (random_range(-2, 2))), choose(63, 63, 62))
        temp.image_index = random_range(0, 1.99)
        temp.image_speed = random_range(0.1, 0.23)
        temp.depth = depth - 2
        temp.hspd = (random_range(-0.2, 0.2)) * (choose(1.1, 0.8, 0.9, 1.2, 1.6))
        temp.vspd = (-abs(temp.hspd))
    }
    if (!muteparticles)
    {
        for (i = 0; i < sprite_get_number(particlesprite); i++)
        {
            temp = instance_create((x - 8), y, obj_rubblepart)
            temp.sprite_index = particlesprite
            temp.image_index = i
            temp.depth = choose((depth - 2), (depth - 2), (depth + 4), (depth - 2))
            temp.hspd *= ((-sign(temp.hspd)) * (random_range((0.7 * (1 + i / 4)), (0.8 * (1 + i / 4)))))
            temp.vspd *= random_range((0.6 * (1 + i / 4)), (0.7 * (1 + i / 4)))
        }
    }
}
